import { request } from "@kesplus/kesplus"
const crudRoot = "/manage_course/post"
export const addApi = (params) => {
	return request.post(crudRoot.concat("/add"), params, { appPrefix: true })
}
export const updateApi = (params) => {
	return request.put(crudRoot.concat("/update"), params, { appPrefix: true })
}
export const deleteApi = (params) => {
	return request.post(crudRoot.concat("/del"), params, { appPrefix: true })
}
export const detailApi = (params) => {
	return request.get(crudRoot.concat("/detail"), { params, appPrefix: true })
}
export const pageApi = (params) => {
	return request.get(crudRoot.concat("/page"), { params, appPrefix: true })
}
export const listApi = (params) => {
	return request.get(crudRoot.concat("/list"), { params, appPrefix: true })
}
