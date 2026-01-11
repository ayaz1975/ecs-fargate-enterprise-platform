import json, glob, os

tag = os.popen("git rev-parse --short HEAD").read().strip()
ecr = f"636851749897.dkr.ecr.eu-north-1.amazonaws.com/ecs-platform-dev-api:{tag}"

files = sorted(glob.glob("taskdef*.json"))
for fn in files:
    with open(fn, "r", encoding="utf-8") as f:
        data = json.load(f)

    td = data.get("taskDefinition", data)
    changed = False
    for c in td.get("containerDefinitions", []):
        if c.get("name") == "app":
            c["image"] = ecr
            c.pop("command", None)  # убрать "-listen=:8000" "-text=ok"
            env = c.get("environment") or []
            env = [x for x in env if x.get("name") != "PORT"]
            env.append({"name": "PORT", "value": "8000"})
            c["environment"] = env
            changed = True

    if changed:
        with open(fn, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2)
            f.write("\n")

print("IMAGE SET TO:", ecr)
print("UPDATED:", ", ".join(files))
