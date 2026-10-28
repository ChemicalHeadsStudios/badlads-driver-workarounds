# BadLads driver workarounds

```json
{
	"schema": 1,
	"revision": 2,
	"workarounds": [
		{
			"id": "amd-mesh-shader-hang",
			"vendor": "AMD",
			"rhi": "D3D12",
			"driverVersion": ">=32.0.21025.10016",
			"reason": "Mesh shaders hang the GPU on this driver.",
			"cvars": { "r.GeometryCluster.MeshShaders": "0" }
		}
	]
}
```

Raise `revision` on every change.

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
| `cvars` | yes | CVar name to value. `r.`, `RHI.`, `D3D12.`, `D3D11.` and `Vulkan.` only. |
