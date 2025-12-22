import { ElMessage, ElMessageBox } from "element-plus"
import { ref, h, reactive } from "vue"
import { useSelect, addDialog, closeDialog, message } from "@kesplus/kesplus"
import { deleteApi, pageApi, listApi } from "./material-api"
import FormComponent from "../form.vue"
/**
 *
 * @param {Object} editOptions
 * @param {String} editOptions.title
 * @param {String} [editOptions.id]
 * @param {()=>void} [editOptions.effect]
 */
export function handleEdit(editOptions) {
	const editRef = ref()
	const optProxy = reactive(editOptions)
	const dialog = addDialog({
		effect: optProxy.effect,
		title: optProxy.title,
		props: optProxy,
		width: "61.8%",

		footerButtons: [
			{
				label: "重置",
				type: "info",
				btnClick: () => editRef.value.reset(),
			},
			{
				label: "保存",
				type: "primary",
				btnClick: () => {
					editRef.value
						.submit()
						.then(() => {
							closeDialog(dialog)
						})
						.catch((e) => {
							throw e
						})
				},
			},
		],

		contentRenderer: () =>
			h(FormComponent, Object.assign({ ref: editRef }, {})),
	})
}
/**
 *
 * @param {string|string[]} ids
 * @param {()=>void} [effect]
 * @returns
 */
export async function handleDelete(ids, effect) {
	const callback = await ElMessageBox.confirm("确认删除？", "删除", {
		showCancelButton: true,
	})
	if (callback !== "confirm") return
	const deleteId = Array.isArray(ids) ? ids.join(",") : ids
	await deleteApi({ ids: deleteId })
	effect?.()
}
/**
 *
 * @param {Object} editOptions
 * @param {String} editOptions.title
 * @param {String} [editOptions.id]
 * @param {()=>void} [editOptions.effect]
 */
export function handleView(editOptions) {
	const viewRef = ref()
	addDialog({
		title: editOptions.title,
		props: editOptions,
		width: "40%",
		contentRenderer: () => h(FormComponent, { ref: viewRef }),
	})
}
export function useMaterialSelect() {
	const { fetch, options, ...rest } = useSelect({
		default: [],
		fetch: async (blurry) => {
			const data = await listApi({ blurry })
			return data
		},
	})
	return {
		...rest,
		options,
		fetch: (blurry) => {
			if (!blurry) return options
			return fetch(blurry)
		},
	}
}
