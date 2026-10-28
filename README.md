# BadLads driver workarounds

`workarounds-1.json`:

```json
{
	"revision": 2,
	"workarounds": [
		{
			"id": "amd-32.0.21045.5002-mesh-shaders",
			"_note": "BADLADS-5",
			"vendor": "AMD",
			"rhi": "D3D12",
			"driverVersion": "==32.0.21045.5002",
			"reason": "Mesh shaders are off: they hang the GPU on this AMD driver.",
			"cvars": { "r.GeometryCluster.MeshShaders": 0 }
		}
	]
}
```

Raise `revision` on every change, then run `./sign.sh` and commit the `.sig` with it. An unsigned or badly signed list is ignored.

| Field | Required | Meaning |
|-------|----------|---------|
| `id` | yes | Unique slug. |
| `vendor` | yes | `NVIDIA`, `AMD`, `Intel` or `Any`. |
| `driverVersion` | one of | Unified driver version with an operator: `==` `!=` `<` `<=` `>` `>=`. |
| `driverDate` | one of | Driver date `MM-DD-YYYY` with an operator. |
| `rhi` | no | `D3D12`, `D3D11` or `Vulkan`. |
| `platform` | no | `Windows` or `Linux`. |
| `adapterNameRegex` | no | Regular expression on the adapter name. |
| `adapterGeneration` | no | Vendor adapter generation with an operator. |
| `deviceIds` | no | PCI device IDs, e.g. `["0x73BF"]`. |
| `reason` | yes | One sentence for players. |
| `cvars` | yes | CVar name to value. |
| `_anything` | no | Notes; ignored. |

A build skips an entry holding a key it does not know. A change older builds would
misread goes in `workarounds-2.json`, beside this one.
