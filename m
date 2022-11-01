Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E33F614BF6
	for <lists+linux-doc@lfdr.de>; Tue,  1 Nov 2022 14:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiKANnk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Nov 2022 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiKANnh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 09:43:37 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6474DFE;
        Tue,  1 Nov 2022 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667310213; x=1698846213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YZ7Ef/FEkvThP4tD0uL0SIDOHp8XpcXrzESKWVmFsL8=;
  b=ct87xiY63rKP8EKHL2KNYXaxrF+2MDM9ax2HwtgVVpHCc7vcIZHE8+l/
   wqq4d5dOvnK8v+CqWf2av/WMSWlcyWWh0aXztGBM34gQkgiuVfoL8tFMI
   owC1/lpTnr1j/HeV2cLozolnV+tZIZjNH/ogRfweaFfUhpk9F6eHQ7wGO
   j+dxW0gTxsdKzHQUqU7NeYN33fkK3Der0rPwUbu6VDQkclaX67BxBw50E
   gTLthYeyG2j+Nfttdi0q4+iOb5/KHrHNt6Irta9DAdb9c2mp3mvw4kHky
   Uqz+pyz4JFdr74o1r1BdcUAprXi8PfbuDg9G4X0TusWP9R5pBVF831QmI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="307860450"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="307860450"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 06:43:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="879088414"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="879088414"
Received: from sgiddu-mobl3.amr.corp.intel.com (HELO [10.209.127.40]) ([10.209.127.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 06:43:32 -0700
Message-ID: <bb9efd4c-ad21-e03b-922d-cc137e52dc28@linux.intel.com>
Date:   Tue, 1 Nov 2022 06:43:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v16 3/3] selftests: tdx: Test TDX attestation GetReport
 support
Content-Language: en-US
To:     Wander Lairson Costa <wander@redhat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        marcelo.cerri@canonical.com, tim.gardner@canonical.com,
        khalid.elmously@canonical.com, philip.cox@canonical.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20221028002820.3303030-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20221028002820.3303030-4-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20221101133556.l7dffiwl24lqjioz@fedora>
From:   Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20221101133556.l7dffiwl24lqjioz@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 11/1/22 6:35 AM, Wander Lairson Costa wrote:
> On Thu, Oct 27, 2022 at 05:28:20PM -0700, Kuppuswamy Sathyanarayanan wrote:
>> Attestation is used to verify the trustworthiness of a TDX guest.
>> During the guest bring-up, the Intel TDX module measures and records
>> the initial contents and configuration of the guest, and at runtime,
>> guest software uses runtime measurement registers (RMTRs) to measure
>> and record details related to kernel image, command line params, ACPI
>> tables, initrd, etc. At guest runtime, the attestation process is used
>> to attest to these measurements.
>>
>> The first step in the TDX attestation process is to get the TDREPORT
>> data. It is a fixed size data structure generated by the TDX module
>> which includes the above mentioned measurements data, a MAC ID to
>> protect the integrity of the TDREPORT, and a 64-Byte of user specified
>> data passed during TDREPORT request which can uniquely identify the
>> TDREPORT.
>>
>> Intel's TDX guest driver exposes TDX_CMD_GET_REPORT IOCTL interface to
>> enable guest userspace to get the TDREPORT.
>>
>> Add a kernel self test module to test this ABI and verify the validity
>> of the generated TDREPORT.
>>
>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Acked-by: Kai Huang <kai.huang@intel.com>
>> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> ---
>>
>> Changes since v15:
>>  * None
>>
>> Changes since v14:
>>  * Fixed format issue in struct comments.
>>  * Rebased on top of v6.1-rc1
>>
>> Changes since v13:
>>  * Removed __packed from TDREPORT structs.
>>  * Since the guest driver is moved to drivers/virt/coco, removed
>>    tools/arch/x86/include header folder usage.
>>  * Fixed struct comments to match kernel-doc format.
>>  * Fixed commit log as per review comments.
>>  * Fixed some format issues in the code.
>>
>> Changes since v12:
>>  * Changed #ifdef DEBUG usage with if (DEBUG).
>>  * Initialized reserved entries values to zero.
>>
>> Changes since v11:
>>  * Renamed devname with TDX_GUEST_DEVNAME.
>>
>> Changes since v10:
>>  * Replaced TD/TD Guest usage with guest or TDX guest.
>>  * Reworded the subject line.
>>
>> Changes since v9:
>>  * Copied arch/x86/include/uapi/asm/tdx.h to tools/arch/x86/include to
>>    decouple header dependency between kernel source and tools dir.
>>  * Fixed Makefile to adapt to above change.
>>  * Fixed commit log and comments.
>>  * Added __packed to hardware structs.
>>
>> Changes since v8:
>>  * Please refer to https://lore.kernel.org/all/ \
>>    20220728034420.648314-1-sathyanarayanan.kuppuswamy@linux.intel.com/
>>
>>  tools/testing/selftests/Makefile             |   1 +
>>  tools/testing/selftests/tdx/Makefile         |   7 +
>>  tools/testing/selftests/tdx/config           |   1 +
>>  tools/testing/selftests/tdx/tdx_guest_test.c | 175 +++++++++++++++++++
>>  4 files changed, 184 insertions(+)
>>  create mode 100644 tools/testing/selftests/tdx/Makefile
>>  create mode 100644 tools/testing/selftests/tdx/config
>>  create mode 100644 tools/testing/selftests/tdx/tdx_guest_test.c
>>
>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
>> index 0464b2c6c1e4..f60e14d16bfd 100644
>> --- a/tools/testing/selftests/Makefile
>> +++ b/tools/testing/selftests/Makefile
>> @@ -73,6 +73,7 @@ TARGETS += sync
>>  TARGETS += syscall_user_dispatch
>>  TARGETS += sysctl
>>  TARGETS += tc-testing
>> +TARGETS += tdx
>>  TARGETS += timens
>>  ifneq (1, $(quicktest))
>>  TARGETS += timers
>> diff --git a/tools/testing/selftests/tdx/Makefile b/tools/testing/selftests/tdx/Makefile
>> new file mode 100644
>> index 000000000000..8dd43517cd55
>> --- /dev/null
>> +++ b/tools/testing/selftests/tdx/Makefile
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +CFLAGS += -O3 -Wl,-no-as-needed -Wall -static
>> +
>> +TEST_GEN_PROGS := tdx_guest_test
>> +
>> +include ../lib.mk
>> diff --git a/tools/testing/selftests/tdx/config b/tools/testing/selftests/tdx/config
>> new file mode 100644
>> index 000000000000..aa1edc829ab6
>> --- /dev/null
>> +++ b/tools/testing/selftests/tdx/config
>> @@ -0,0 +1 @@
>> +CONFIG_TDX_GUEST_DRIVER=y
>> diff --git a/tools/testing/selftests/tdx/tdx_guest_test.c b/tools/testing/selftests/tdx/tdx_guest_test.c
>> new file mode 100644
>> index 000000000000..a5c243f73adc
>> --- /dev/null
>> +++ b/tools/testing/selftests/tdx/tdx_guest_test.c
>> @@ -0,0 +1,175 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Test TDX guest features
>> + *
>> + * Copyright (C) 2022 Intel Corporation.
>> + *
>> + * Author: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>> + */
>> +
>> +#include <sys/ioctl.h>
>> +
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +
>> +#include "../kselftest_harness.h"
>> +#include "../../../../include/uapi/linux/tdx-guest.h"
>> +
>> +#define TDX_GUEST_DEVNAME "/dev/tdx_guest"
>> +#define HEX_DUMP_SIZE 8
>> +#define DEBUG 0
>> +
>> +/**
>> + * struct tdreport_type - Type header of TDREPORT_STRUCT.
>> + * @type: Type of the TDREPORT (0 - SGX, 81 - TDX, rest are reserved)
>> + * @sub_type: Subtype of the TDREPORT (Default value is 0).
>> + * @version: TDREPORT version (Default value is 0).
>> + * @reserved: Added for future extension.
>> + *
>> + * More details can be found in TDX v1.0 module specification, sec
>> + * titled "REPORTTYPE".
>> + */
>> +struct tdreport_type {
>> +	__u8 type;
>> +	__u8 sub_type;
>> +	__u8 version;
>> +	__u8 reserved;
>> +};
>> +
>> +/**
>> + * struct reportmac - TDX guest report data, MAC and TEE hashes.
>> + * @type: TDREPORT type header.
>> + * @reserved1: Reserved for future extension.
>> + * @cpu_svn: CPU security version.
>> + * @tee_tcb_info_hash: SHA384 hash of TEE TCB INFO.
>> + * @tee_td_info_hash: SHA384 hash of TDINFO_STRUCT.
>> + * @reportdata: User defined unique data passed in TDG.MR.REPORT request.
>> + * @reserved2: Reserved for future extension.
>> + * @mac: CPU MAC ID.
>> + *
>> + * It is MAC-protected and contains hashes of the remainder of the
>> + * report structure along with user provided report data. More details can
>> + * be found in TDX v1.0 Module specification, sec titled "REPORTMACSTRUCT"
>> + */
>> +struct reportmac {
>> +	struct tdreport_type type;
>> +	__u8 reserved1[12];
>> +	__u8 cpu_svn[16];
>> +	__u8 tee_tcb_info_hash[48];
>> +	__u8 tee_td_info_hash[48];
>> +	__u8 reportdata[64];
>> +	__u8 reserved2[32];
>> +	__u8 mac[32];
>> +};
>> +
>> +/**
>> + * struct td_info - TDX guest measurements and configuration.
>> + * @attr: TDX Guest attributes (like debug, spet_disable, etc).
>> + * @xfam: Extended features allowed mask.
>> + * @mrtd: Build time measurement register.
>> + * @mrconfigid: Software-defined ID for non-owner-defined configuration
>> + *              of the guest - e.g., run-time or OS configuration.
>> + * @mrowner: Software-defined ID for the guest owner.
>> + * @mrownerconfig: Software-defined ID for owner-defined configuration of
>> + *                 the guest - e.g., specific to the workload.
>> + * @rtmr: Run time measurement registers.
>> + * @reserved: Added for future extension.
>> + *
>> + * It contains the measurements and initial configuration of the TDX guest
>> + * that was locked at initialization and a set of measurement registers
>> + * that are run-time extendable. More details can be found in TDX v1.0
>> + * Module specification, sec titled "TDINFO_STRUCT".
>> + */
>> +struct td_info {
>> +	__u8 attr[8];
>> +	__u64 xfam;
>> +	__u64 mrtd[6];
>> +	__u64 mrconfigid[6];
>> +	__u64 mrowner[6];
>> +	__u64 mrownerconfig[6];
>> +	__u64 rtmr[24];
>> +	__u64 reserved[14];
>> +};
>> +
>> +/*
>> + * struct tdreport - Output of TDCALL[TDG.MR.REPORT].
>> + * @reportmac: Mac protected header of size 256 bytes.
>> + * @tee_tcb_info: Additional attestable elements in the TCB are not
>> + *                reflected in the reportmac.
>> + * @reserved: Added for future extension.
>> + * @tdinfo: Measurements and configuration data of size 512 bytes.
>> + *
>> + * More details can be found in TDX v1.0 Module specification, sec
>> + * titled "TDREPORT_STRUCT".
>> + */
>> +struct tdreport {
>> +	struct reportmac reportmac;
>> +	__u8 tee_tcb_info[239];
>> +	__u8 reserved[17];
>> +	struct td_info tdinfo;
>> +};
>> +
>> +static void print_array_hex(const char *title, const char *prefix_str,
>> +			    const void *buf, int len)
>> +{
>> +	int i, j, line_len, rowsize = HEX_DUMP_SIZE;
>> +	const __u8 *ptr = buf;
>> +
>> +	if (!len || !buf)
> 
> If len is not zero and buf is null, this would be bug. It is better to
> let the code crash or assert buf isn't null after testing len.

It is just a debug dump routine. So I don't think you need to add assert or
crash here. If you really want some indication, maybe we can add an error message
for invalid params.

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
