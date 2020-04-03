import React from 'react'
import { Icon,Divider, Avatar, Card, Col, Tag} from 'antd'

import { Link } from 'dva/router'
import moment from 'moment'
import ImagePreview from '../../components/ImagePreview'
import appLocaleName from '../../common/Locale.tool'
import BaseTool from '../../common/Base.tool'
import GlobalComponents from '../../custcomponents'
import DescriptionList from '../../components/DescriptionList'
const { Description } = DescriptionList
import styles from './EventAttendance.base.less'
const {
	defaultRenderReferenceCell,
	defaultRenderBooleanCell,
	defaultRenderMoneyCell,
	defaultRenderDateTimeCell,
	defaultRenderImageCell,
	defaultRenderAvatarCell,
	defaultRenderDateCell,
	defaultRenderIdentifier,
	defaultRenderTextCell,
	defaultSearchLocalData,
} = BaseTool

const renderTextCell=defaultRenderTextCell
const renderIdentifier=defaultRenderIdentifier
const renderDateCell=defaultRenderDateCell
const renderDateTimeCell=defaultRenderDateTimeCell
const renderImageCell=defaultRenderImageCell
const renderAvatarCell=defaultRenderAvatarCell
const renderMoneyCell=defaultRenderMoneyCell
const renderBooleanCell=defaultRenderBooleanCell
const renderReferenceCell=defaultRenderReferenceCell



const menuData = {menuName: window.trans('event_attendance'), menuFor: "eventAttendance",
  		subItems: [
  
  		],
}


const settingMenuData = {menuName: window.trans('event_attendance'), menuFor: "eventAttendance",
  		subItems: [
  
  		],
}

const fieldLabels = {
  id: window.trans('event_attendance.id'),
  name: window.trans('event_attendance.name'),
  potentialCustomer: window.trans('event_attendance.potential_customer'),
  cityEvent: window.trans('event_attendance.city_event'),
  description: window.trans('event_attendance.description'),

}

const displayColumns = [
  { title: fieldLabels.id, debugtype: 'string', dataIndex: 'id', width: '8', render: (text, record)=>renderTextCell(text,record,'eventAttendance') , sorter: true },
  { title: fieldLabels.name, debugtype: 'string', dataIndex: 'name', width: '13',render: (text, record)=>renderTextCell(text,record)},
  { title: fieldLabels.potentialCustomer, dataIndex: 'potentialCustomer', render: (text, record) => renderReferenceCell(text, record), sorter:true},
  { title: fieldLabels.cityEvent, dataIndex: 'cityEvent', render: (text, record) => renderReferenceCell(text, record), sorter:true},
  { title: fieldLabels.description, debugtype: 'string', dataIndex: 'description', width: '13',render: (text, record)=>renderTextCell(text,record)},

]


const searchLocalData =(targetObject,searchTerm)=> defaultSearchLocalData(menuData,targetObject,searchTerm)
<<<<<<< HEAD
const colorList = ['#f56a00', '#7265e6', '#ffbf00', '#00a2ae'];
let counter = 0;
const genColor=()=>{
	counter++;
	return colorList[counter%colorList.length];
}
const followColor=()=>{
	return 'green';
	// return colorList[counter%colorList.length];
}
const leftChars=(value, left)=>{
	const chars = left || 4
	if(!value){
		return "N/A"
	}
	return value.substring(0,chars);
}
const renderItemOfList=(eventAttendance, targetComponent, columCount)=>{
  const displayColumnsCount = columCount || 4
=======

const renderItemOfList=(eventAttendance, targetComponent, columCount)=>{
  const displayColumnsCount = columCount || 2
>>>>>>> b1266426b024c6919f91c6b5be4635d10d614fe9
  const userContext = null
  return (
    <Card key={eventAttendance.id} style={{marginTop:"10px"}}>
		
	<Col span={4}>
		<Avatar size={90} style={{ backgroundColor: genColor(), verticalAlign: 'middle' }}>
			{leftChars(eventAttendance.displayName)}
		</Avatar>
	</Col>
	<Col span={20}>
	  
	  
	 
	
      <DescriptionList  key={eventAttendance.id} size="small" col={displayColumnsCount} >
        <Description term={fieldLabels.id} style={{wordBreak: 'break-all'}}>{eventAttendance.id}</Description> 
        <Description term={fieldLabels.name} style={{wordBreak: 'break-all'}}>{eventAttendance.name}</Description> 
        <Description term={fieldLabels.potentialCustomer}><Tag color='blue' title={`${eventAttendance.potentialCustomer.id}-${eventAttendance.potentialCustomer.displayName}`}>{eventAttendance.potentialCustomer==null?appLocaleName(userContext,"NotAssigned"):`${leftChars(eventAttendance.potentialCustomer.displayName,15)}`}
        </Tag></Description>
        <Description term={fieldLabels.cityEvent}><Tag color='blue' title={`${eventAttendance.cityEvent.id}-${eventAttendance.cityEvent.displayName}`}>{eventAttendance.cityEvent==null?appLocaleName(userContext,"NotAssigned"):`${leftChars(eventAttendance.cityEvent.displayName,15)}`}
        </Tag></Description>
        <Description term={fieldLabels.description} style={{wordBreak: 'break-all'}}>{eventAttendance.description}</Description> 
	
        
      </DescriptionList>
     </Col>
    </Card>
	)

}
	
const packFormValuesToObject = ( formValuesToPack )=>{
	const {name, description, potentialCustomerId, cityEventId} = formValuesToPack
	const potentialCustomer = {id: potentialCustomerId, version: 2^31}
	const cityEvent = {id: cityEventId, version: 2^31}
	const data = {name, description, potentialCustomer, cityEvent}
	return data
}
const unpackObjectToFormValues = ( objectToUnpack )=>{
	const {name, description, potentialCustomer, cityEvent} = objectToUnpack
	const potentialCustomerId = potentialCustomer ? potentialCustomer.id : null
	const cityEventId = cityEvent ? cityEvent.id : null
	const data = {name, description, potentialCustomerId, cityEventId}
	return data
}
const stepOf=(targetComponent, title, content, position, index)=>{
	return {
		title,
		content,
		position,
		packFunction: packFormValuesToObject,
		unpackFunction: unpackObjectToFormValues,
		index,
      }
}
const EventAttendanceBase={menuData,settingMenuData,displayColumns,fieldLabels,renderItemOfList, stepOf, searchLocalData}
export default EventAttendanceBase

