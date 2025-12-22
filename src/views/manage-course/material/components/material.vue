<template>
	<KSection>
		<KBlock :bordered="true">
			<KFormGrid :maxColumns="2" :columnGap="32" :strictAutoFit="true">
				<KFormGridColumn :grid-span="1">
					<el-form-item label="资料ID" prop="materialId" :rules="[required]">
						<el-input-number :clearable="true" v-model="form.materialId">
						</el-input-number>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="课程ID" prop="courseId" :rules="[required]">
						<el-input :clearable="true" v-model="form.courseId"> </el-input>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="标题" prop="title" :rules="[required]">
						<el-input :clearable="true" v-model="form.title"> </el-input>
					</el-form-item>
				</KFormGridColumn>
				<KFormGridColumn :grid-span="1">
					<el-form-item label="附件" prop="fileId" :rules="[required]">
						<k-upload-file
							:clearable="true"
							:limit="1"
							v-model:values="form._fileId"
							v-model="form.fileId"
						>
						</k-upload-file>
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
form.material ||= {}
const props = defineProps({
	id: { type: String },
})
</script>
