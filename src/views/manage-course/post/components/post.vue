<template>
	<KSection>
		<KBlock :bordered="true">
			<KFormGrid :maxColumns="2" :columnGap="32" :strictAutoFit="true">
				<KFormGridColumn :grid-span="1">
					<el-form-item label="帖子ID" prop="postId" :rules="[required]">
						<el-input-number :clearable="true" v-model="form.postId">
						</el-input-number>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="用户ID" prop="userId" :rules="[required]">
						<el-input-number :clearable="true" v-model="form.userId">
						</el-input-number>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="标题" prop="title" :rules="[required]">
						<el-input :clearable="true" v-model="form.title"> </el-input>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="内容" prop="content" :rules="[required]">
						<KRtf
							:clearable="true"
							:modelValue="form.content ?? ''"
							@update:modelValue="(val) => (form.content = val)"
						>
						</KRtf>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="点赞次数" prop="likeCount">
						<el-input-number :clearable="true" v-model="form.likeCount">
						</el-input-number>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="浏览次数" prop="viewCount">
						<el-input-number :clearable="true" v-model="form.viewCount">
						</el-input-number>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="评论次数" prop="commentCount">
						<el-input-number :clearable="true" v-model="form.commentCount">
						</el-input-number>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="创建时间" prop="createTime" :rules="[required]">
						<el-input :clearable="true" v-model="form.createTime"> </el-input>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="课程ID" prop="courseId" :rules="[required]">
						<el-input :clearable="true" v-model="form.courseId"> </el-input>
					</el-form-item>
				</KFormGridColumn>
			</KFormGrid>
		</KBlock>
	</KSection>
</template>
<script setup>
import { ref, toRef, watchEffect } from "vue"
import {
	useDialogFormContext,
	required,
	email as mail,
	phone as phoneNumber,
	lengthValidate,
} from "@kesplus/kesplus"
const { form, submit, reset, fetchById } = useDialogFormContext()
form.post ||= {}
const props = defineProps({
	id: { type: String },
})
</script>
