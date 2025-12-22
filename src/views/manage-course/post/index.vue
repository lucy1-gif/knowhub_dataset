<template>
	<KQueryList>
		<KQueryTable>
			<KTableBar title="论坛表" :columns="columns" @refresh="fetchData">
				<template #buttons>
					<el-button
						v-access="'manageCourse:post:add'"
						type="primary"
						:icon="useRenderIcon('Plus')"
						@click="
							() => handleEdit({ title: '新增论坛表', effect: fetchData })
						"
					>
						新增
					</el-button>
				</template>
				<template #default="{ size, dynamicColumns }">
					<KTable
						border
						row-key="id"
						align-whole="center"
						show-overflow-tooltip
						table-layout="auto"
						:loading="loading"
						:size="size"
						height="100%"
						:data="listData"
						:columns="dynamicColumns"
						:pagination="pagination"
						:paginationSmall="size === 'small' ? true : false"
						@sort-change="handelSortChange"
						@page-size-change="handlePageSizeChange"
						@page-current-change="handleCurrentPageChange"
					>
						<template #operation="{ row }">
							<el-button
								v-access="'manageCourse:post:edit'"
								class="!m-0"
								link
								type="primary"
								:size="size"
								:icon="useRenderIcon('EditPen')"
								@click="
									() =>
										handleEdit({
											id: row.id,
											title: '编辑论坛表',

											effect: fetchData,
										})
								"
							>
								编辑
							</el-button>
							<el-button
								v-access="'manageCourse:post:del'"
								class="!m-0"
								link
								type="danger"
								:size="size"
								:icon="useRenderIcon('Delete')"
								@click="() => handleDelete(row.id, fetchData)"
							>
								删除
							</el-button>
						</template>

						<template #content="{ row }">
							<div v-html="row.content"></div>
						</template>
					</KTable>
				</template>
			</KTableBar>
		</KQueryTable>
	</KQueryList>
</template>
<script setup>
import { onBeforeMount } from "vue"
import {
	defineRouteMeta,
	usePageModel,
	getSortChangeStr,
	numeral,
	KFilePreviewer,
} from "@kesplus/kesplus"
import { deleteApi, pageApi } from "./utils/post-api"
import { handleEdit, handleView, handleDelete } from "./utils/hooks"
import dayjs from "@kesplus/dayjs"
defineOptions({
	handleEdit,
	handleView,
})
defineRouteMeta({
	title: "论坛表",
	anonymous: true,
})
const {
	queryForm,
	resetForm,
	loading,
	listData,
	pagination,
	handlePageSizeChange,
	handleCurrentPageChange,
	fetchData,
} = usePageModel({
	queryForm: {
		orderColumns: "",
	},
	pageSize: 10,
	fetch: async (_pager) => {
		const callback = await pageApi({
			...queryForm,
			pageIndex: _pager.currentPage,
			pageSize: _pager.pageSize,
		})
		return {
			totalElements: callback?.totalElements ?? 0,
			content: callback?.content || [],
		}
	},
	hasPermission: () => access.hasAccess("manageCourse:post:detail"),
})
const columns = [
	{
		label: "",
		type: "selection",
		align: "center",
		width: "28px",
		showOverflowTooltip: false,
	},
	//   {
	//     label: "序号",
	//     type: "index",
	//     width: 60,
	//   },

	{
		label: "帖子ID",

		prop: "postId",

		align: "center",

		"min-width": "150px",

		sortable: "custom",

		// 使用 numeral 库对数据进行格式化
		formatter:
			// (row, column, cellValue, index) => { return typeof(cellValue) === "number"? numeral(cellValue).format("0,0"): cellValue}
			(row, column, cellValue, index) => cellValue,
	},
	{
		label: "用户ID",

		prop: "userId",

		align: "center",

		"min-width": "150px",

		sortable: "custom",

		// 使用 numeral 库对数据进行格式化
		formatter:
			// (row, column, cellValue, index) => { return typeof(cellValue) === "number"? numeral(cellValue).format("0,0"): cellValue}
			(row, column, cellValue, index) => cellValue,
	},
	{
		label: "标题",

		prop: "title",

		align: "center",

		"min-width": "150px",

		sortable: "custom",
	},
	{
		label: "内容",

		prop: "content",

		align: "center",

		"min-width": "150px",

		sortable: "custom",

		slot: "content",
	},
	{
		label: "点赞次数",

		prop: "likeCount",

		align: "center",

		"min-width": "150px",

		sortable: "custom",

		// 使用 numeral 库对数据进行格式化
		formatter:
			// (row, column, cellValue, index) => { return typeof(cellValue) === "number"? numeral(cellValue).format("0,0"): cellValue}
			(row, column, cellValue, index) => cellValue,
	},
	{
		label: "浏览次数",

		prop: "viewCount",

		align: "center",

		"min-width": "150px",

		sortable: "custom",

		// 使用 numeral 库对数据进行格式化
		formatter:
			// (row, column, cellValue, index) => { return typeof(cellValue) === "number"? numeral(cellValue).format("0,0"): cellValue}
			(row, column, cellValue, index) => cellValue,
	},
	{
		label: "评论次数",

		prop: "commentCount",

		align: "center",

		"min-width": "150px",

		sortable: "custom",

		// 使用 numeral 库对数据进行格式化
		formatter:
			// (row, column, cellValue, index) => { return typeof(cellValue) === "number"? numeral(cellValue).format("0,0"): cellValue}
			(row, column, cellValue, index) => cellValue,
	},
	{
		label: "创建时间",

		prop: "createTime",

		align: "center",

		"min-width": "150px",

		sortable: "custom",
	},
	{
		label: "课程ID",

		prop: "courseId",

		align: "center",

		"min-width": "150px",

		sortable: "custom",
	},
	{
		label: "操作",
		width: 230,
		align: "center",
		fixed: "right",
		slot: "operation",
		showOverflowTooltip: false,
	},
]
const handelSortChange = ({ prop, order }) => {
	queryForm.orderColumns = getSortChangeStr({ prop, order })
	fetchData()
}
onBeforeMount(fetchData)
</script>
