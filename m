Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFFF34FDF5
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 12:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbhCaKVB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 06:21:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29434 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234375AbhCaKUx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 06:20:53 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12VA4BOU048660;
        Wed, 31 Mar 2021 06:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=p6YVCg1411fVcZy23Dy4j74YNztaVR4TyNA+hmWAe84=;
 b=WAynXgSflsuTxDXIW+ATC2sSrpvYsTXv+wt3bUM3j9bXyijEzZeooSooOMB7BXL8WOfP
 QAU7pzV/q7me3vT6rcwBDipcEpyj/TY/+O+0eTRYObrIDLkFzLaq/6FuBzImGynnQyBc
 EfScxLCJNv/0yK65B0QZ6UcBsNxj5LZ35vJtSCwpHk96wfZ/CYqWeMmwbZQKQjsD7hPL
 a9qiSO5mlNoCHsudJXrBxxJLecrPVS8tcRs6nLg0tNOPAz7lZtp6BznPiT3Y4QKRZiOu
 a/rxYcDqrX/5aZHidrOdI2FnH5twuFw5oxmZbTTNzovIAiSf0v/YgQOpsknJQVMqUki1 aw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37mb3h8wdt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 06:20:46 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VA8Z0d007092;
        Wed, 31 Mar 2021 10:20:45 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma02fra.de.ibm.com with ESMTP id 37maaqr8w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 10:20:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12VAKgeR33489384
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 31 Mar 2021 10:20:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A49C042042;
        Wed, 31 Mar 2021 10:20:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 53D7142052;
        Wed, 31 Mar 2021 10:20:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 31 Mar 2021 10:20:42 +0000 (GMT)
Received: from localhost (unknown [9.206.131.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8CEDE60599;
        Wed, 31 Mar 2021 21:20:40 +1100 (AEDT)
From:   Michael Ellerman <ellerman@au1.ibm.com>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        sbhat@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
        kvm-ppc@vger.kernel.org, linux-nvdimm@lists.01.org
Cc:     linux-doc@vger.kernel.org, vaibhav@linux.ibm.com
Subject: Re: [PATCH v3] powerpc/papr_scm: Implement support for H_SCM_FLUSH
 hcall
In-Reply-To: <87mtul6xzj.fsf@linux.ibm.com>
References: <161703936121.36.7260632399582101498.stgit@e1fbed493c87>
 <87mtul6xzj.fsf@linux.ibm.com>
Date:   Wed, 31 Mar 2021 21:20:36 +1100
Message-ID: <87zgyjwrnv.fsf@mpe.ellerman.id.au>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kI7olCKHAEIbR5wjk2XHs2J1MqGiFAtQ
X-Proofpoint-GUID: kI7olCKHAEIbR5wjk2XHs2J1MqGiFAtQ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_03:2021-03-30,2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310073
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
>
>> Add support for ND_REGION_ASYNC capability if the device tree
>> indicates 'ibm,hcall-flush-required' property in the NVDIMM node.
>> Flush is done by issuing H_SCM_FLUSH hcall to the hypervisor.
>>
>> If the flush request failed, the hypervisor is expected to
>> to reflect the problem in the subsequent nvdimm H_SCM_HEALTH call.
>>
>> This patch prevents mmap of namespaces with MAP_SYNC flag if the
>> nvdimm requires an explicit flush[1].
>>
>> References:
>> [1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c
>
>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Do we need an ack from nvdimm folks on this?

Or is it entirely powerpc internal (seems like it from the diffstat)?

cheers
