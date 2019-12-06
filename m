Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 296F811579C
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2019 20:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfLFTQc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Dec 2019 14:16:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60090 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726298AbfLFTQc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Dec 2019 14:16:32 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB6JC5Zc100683
        for <linux-doc@vger.kernel.org>; Fri, 6 Dec 2019 14:16:30 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2wq2twctf6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 06 Dec 2019 14:16:30 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sourabhjain@linux.ibm.com>;
        Fri, 6 Dec 2019 19:16:28 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 6 Dec 2019 19:16:26 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xB6JGPWr60489848
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 6 Dec 2019 19:16:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5111D42049;
        Fri,  6 Dec 2019 19:16:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 902D14204B;
        Fri,  6 Dec 2019 19:16:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.71.21])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri,  6 Dec 2019 19:16:23 +0000 (GMT)
Subject: Re: [PATCH v4 4/6] powerpc/powernv: move core and
 fadump_release_opalcore under new kobject
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mpe@ellerman.id.au, mahesh@linux.vnet.ibm.com,
        hbathini@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-5-sourabhjain@linux.ibm.com>
 <20191206124801.GD1360047@kroah.com>
From:   Sourabh Jain <sourabhjain@linux.ibm.com>
Date:   Sat, 7 Dec 2019 00:46:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191206124801.GD1360047@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19120619-0008-0000-0000-0000033E5B01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120619-0009-0000-0000-00004A5D8325
Message-Id: <d22893e3-41e0-c8db-9262-670f90536816@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_06:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912060154
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 12/6/19 6:18 PM, Greg KH wrote:
> On Fri, Dec 06, 2019 at 05:54:32PM +0530, Sourabh Jain wrote:
>> The /sys/firmware/opal/core and /sys/kernel/fadump_release_opalcore sysfs
>> files are used to export and release the OPAL memory on PowerNV platform.
>> let's organize them into a new kobject under /sys/firmware/opal/mpipl/
>> directory.
>>
>> A symlink is added to maintain the backward compatibility for
>> /sys/firmware/opal/core sysfs file.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  .../sysfs-kernel-fadump_release_opalcore      |  2 ++
>>  .../powerpc/firmware-assisted-dump.rst        | 15 +++++----
>>  arch/powerpc/platforms/powernv/opal-core.c    | 31 ++++++++++++++-----
>>  3 files changed, 34 insertions(+), 14 deletions(-)
>>  rename Documentation/ABI/{testing => removed}/sysfs-kernel-fadump_release_opalcore (82%)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
>> similarity index 82%
>> rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
>> rename to Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
>> index 53313c1d4e7a..a8d46cd0f4e6 100644
>> --- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
>> +++ b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
>> @@ -1,3 +1,5 @@
>> +This ABI is moved to /sys/firmware/opal/mpipl/release_core.
>> +
>>  What:		/sys/kernel/fadump_release_opalcore
>>  Date:		Sep 2019
>>  Contact:	linuxppc-dev@lists.ozlabs.org
>> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
>> index 0455a78486d5..345a3405206e 100644
>> --- a/Documentation/powerpc/firmware-assisted-dump.rst
>> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
>> @@ -112,13 +112,13 @@ to ensure that crash data is preserved to process later.
>>  
>>  -- On OPAL based machines (PowerNV), if the kernel is build with
>>     CONFIG_OPAL_CORE=y, OPAL memory at the time of crash is also
>> -   exported as /sys/firmware/opal/core file. This procfs file is
>> +   exported as /sys/firmware/opal/mpipl/core file. This procfs file is
>>     helpful in debugging OPAL crashes with GDB. The kernel memory
>>     used for exporting this procfs file can be released by echo'ing
>> -   '1' to /sys/kernel/fadump_release_opalcore node.
>> +   '1' to /sys/firmware/opal/mpipl/release_core node.
>>  
>>     e.g.
>> -     # echo 1 > /sys/kernel/fadump_release_opalcore
>> +     # echo 1 > /sys/firmware/opal/mpipl/release_core
>>  
>>  Implementation details:
>>  -----------------------
>> @@ -283,14 +283,17 @@ Here is the list of files under kernel sysfs:
>>      enhanced to use this interface to release the memory reserved for
>>      dump and continue without 2nd reboot.
>>  
>> - /sys/kernel/fadump_release_opalcore
>> +Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
>> +      /sys/firmware/opal/mpipl/release_core
>> +
>> + /sys/firmware/opal/mpipl/release_core
>>  
>>      This file is available only on OPAL based machines when FADump is
>>      active during capture kernel. This is used to release the memory
>> -    used by the kernel to export /sys/firmware/opal/core file. To
>> +    used by the kernel to export /sys/firmware/opal/mpipl/core file. To
>>      release this memory, echo '1' to it:
>>  
>> -    echo 1  > /sys/kernel/fadump_release_opalcore
>> +    echo 1  > /sys/firmware/opal/mpipl/release_core
>>  
>>  Here is the list of files under powerpc debugfs:
>>  (Assuming debugfs is mounted on /sys/kernel/debug directory.)
>> diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
>> index ed895d82c048..7fcc092d065e 100644
>> --- a/arch/powerpc/platforms/powernv/opal-core.c
>> +++ b/arch/powerpc/platforms/powernv/opal-core.c
>> @@ -589,7 +589,8 @@ static ssize_t fadump_release_opalcore_store(struct kobject *kobj,
>>  	return count;
>>  }
>>  
>> -static struct kobj_attribute opalcore_rel_attr = __ATTR(fadump_release_opalcore,
>> +struct kobject *mpipl_kobj;
>> +static struct kobj_attribute opalcore_rel_attr = __ATTR(release_core,
>>  						0200, NULL,
>>  						fadump_release_opalcore_store);
> 
> __ATTR_WO()?

Thanks :)
> 
>>  
>> @@ -609,7 +610,7 @@ static int __init opalcore_init(void)
>>  	 * then capture the dump.
>>  	 */
>>  	if (!(is_opalcore_usable())) {
>> -		pr_err("Failed to export /sys/firmware/opal/core\n");
>> +		pr_err("Failed to export /sys/firmware/opal/mpipl/core\n");
>>  		opalcore_cleanup();
>>  		return rc;
>>  	}
>> @@ -617,18 +618,32 @@ static int __init opalcore_init(void)
>>  	/* Set OPAL core file size */
>>  	opal_core_attr.size = oc_conf->opalcore_size;
>>  
>> +	mpipl_kobj = kobject_create_and_add("mpipl", opal_kobj);
>> +	if (!mpipl_kobj) {
>> +		pr_err("unable to create mpipl kobject\n");
>> +		return -ENOMEM;
>> +	}
>> +
>>  	/* Export OPAL core sysfs file */
>> -	rc = sysfs_create_bin_file(opal_kobj, &opal_core_attr);
>> +	rc = sysfs_create_bin_file(mpipl_kobj, &opal_core_attr);
> 
> Again, create an attribute group and add everything all at once, makes
> it much simpler and your error cleanup logic will actually work :)

Agree.

Thanks,
Sourabh Jain

