Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59FC535F0B3
	for <lists+linux-doc@lfdr.de>; Wed, 14 Apr 2021 11:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347352AbhDNJWK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Apr 2021 05:22:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55404 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230247AbhDNJWK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 05:22:10 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13E9ItNg044547;
        Wed, 14 Apr 2021 05:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=EPNGEDtpOfcUlGXIeH34u9IMk2OhUx9OVMDjhXgSY6E=;
 b=Mw1BLnbOyIU2sHatRI2SBZNld0yBRYHVaQ67Kbjq+5lSA97SjjEuPd+aRZAMZ1JajftM
 JlCJi+4z/r8ao9qVXNc27E2jqGsU7SYzky+HT0DqQW29nt80AJ9PoXT5AEBY6xyfBAqT
 JPuVwwpH6qgHA/PVlxSyixN6kAnFZirDu62aFib2lYZz8vRYoXBBSjbBrEq903/ZiXDG
 WBtmwkyW3Cx8T3KldFxBUzle5njvCvPF3Mgoc9Yg6fPIxj8pCmigjTX795xQfSl7Mhe0
 Eysm6koq6IxHae/KqJ50Wr9b758FdQGijQSIvNodNWHdOLYb2iRyw5BUrV8Byhg7bJXf ew== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn601fa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Apr 2021 05:21:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13E9IOl5014673;
        Wed, 14 Apr 2021 09:21:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 37u3n8b688-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Apr 2021 09:21:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13E9LIJB28442968
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 14 Apr 2021 09:21:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7B430A4064;
        Wed, 14 Apr 2021 09:21:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BE1AFA4054;
        Wed, 14 Apr 2021 09:21:37 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.72.167])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
        Wed, 14 Apr 2021 09:21:37 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation); Wed, 14 Apr 2021 14:51:36 +0530
From:   Vaibhav Jain <vaibhav@linux.ibm.com>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        sbhat@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        kvm-ppc@vger.kernel.org, linux-nvdimm@lists.01.org,
        ellerman@au1.ibm.com
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] powerpc/papr_scm: Implement support for H_SCM_FLUSH
 hcall
In-Reply-To: <877dl530id.fsf@linux.ibm.com>
References: <161703936121.36.7260632399582101498.stgit@e1fbed493c87>
 <87sg3ujmrm.fsf@vajain21.in.ibm.com> <877dl530id.fsf@linux.ibm.com>
Date:   Wed, 14 Apr 2021 14:51:36 +0530
Message-ID: <87o8ehjk67.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QU2-Dpz_DZFHz8o9MVMVVZ18AoGIeW2Y
X-Proofpoint-ORIG-GUID: QU2-Dpz_DZFHz8o9MVMVVZ18AoGIeW2Y
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-14_06:2021-04-14,2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140060
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
>> Hi Shiva,
>>
>> Apologies for a late review but something just caught my eye while
>> working on a different patch.
>>
>> Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
>>
>>> Add support for ND_REGION_ASYNC capability if the device tree
>>> indicates 'ibm,hcall-flush-required' property in the NVDIMM node.
>>> Flush is done by issuing H_SCM_FLUSH hcall to the hypervisor.
>>>
>>> If the flush request failed, the hypervisor is expected to
>>> to reflect the problem in the subsequent nvdimm H_SCM_HEALTH call.
>>>
>>> This patch prevents mmap of namespaces with MAP_SYNC flag if the
>>> nvdimm requires an explicit flush[1].
>>>
>>> References:
>>> [1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c
>>>
>>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>>> ---
>>> v2 - https://www.spinics.net/lists/kvm-ppc/msg18799.html
>>> Changes from v2:
>>>        - Fixed the commit message.
>>>        - Add dev_dbg before the H_SCM_FLUSH hcall
>>>
>>> v1 - https://www.spinics.net/lists/kvm-ppc/msg18272.html
>>> Changes from v1:
>>>        - Hcall semantics finalized, all changes are to accomodate them.
>>>
>>>  Documentation/powerpc/papr_hcalls.rst     |   14 ++++++++++
>>>  arch/powerpc/include/asm/hvcall.h         |    3 +-
>>>  arch/powerpc/platforms/pseries/papr_scm.c |   40 +++++++++++++++++++++++++++++
>>>  3 files changed, 56 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
>>> index 48fcf1255a33..648f278eea8f 100644
>>> --- a/Documentation/powerpc/papr_hcalls.rst
>>> +++ b/Documentation/powerpc/papr_hcalls.rst
>>> @@ -275,6 +275,20 @@ Health Bitmap Flags:
>>>  Given a DRC Index collect the performance statistics for NVDIMM and copy them
>>>  to the resultBuffer.
>>>  
>>> +**H_SCM_FLUSH**
>>> +
>>> +| Input: *drcIndex, continue-token*
>>> +| Out: *continue-token*
>>> +| Return Value: *H_SUCCESS, H_Parameter, H_P2, H_BUSY*
>>> +
>>> +Given a DRC Index Flush the data to backend NVDIMM device.
>>> +
>>> +The hcall returns H_BUSY when the flush takes longer time and the hcall needs
>>> +to be issued multiple times in order to be completely serviced. The
>>> +*continue-token* from the output to be passed in the argument list of
>>> +subsequent hcalls to the hypervisor until the hcall is completely serviced
>>> +at which point H_SUCCESS or other error is returned by the hypervisor.
>>> +
>> Does the hcall semantic also include measures to trigger a barrier/fence
>> (like pm_wmb()) so that all the stores before the hcall are gauranteed
>> to have hit the pmem controller ?
>
> It is upto the hypervisor to implement the right sequence to ensure the
> guarantee. The hcall doesn't expect the store to reach the platform
> buffers.

Since the asyc_flush function is also called for performing
deep_flush from libnvdimm and as the hcall doesnt gaurantee stores to
reach the platform buffers, hence papr_scm_pmem_flush() should issue
pm_wmb() before the hcall.

This would ensure papr_scm_pmem_flush() semantics are consistent that to
generic_nvdimm_flush().

Also, adding the statement "The hcall doesn't expect the store to reach
the platform buffers" to the hcall documentation would be good to have.

>
>
>>
>> If not then the papr_scm_pmem_flush() introduced below should issue a
>> fence like pm_wmb() before issuing the flush hcall.
>>
>> If yes then this behaviour should also be documented with the hcall
>> semantics above.
>>
>
> IIUC fdatasync on the backend file is enough to ensure the
> guaraantee. Such a request will have REQ_PREFLUSH and REQ_FUA which will
> do the necessary barrier on the backing device holding the backend file.
>
Right, but thats assuming nvdimm is backed by a regular file in
hypervisor which may not always be the case.


> -aneesh

-- 
Cheers
~ Vaibhav
