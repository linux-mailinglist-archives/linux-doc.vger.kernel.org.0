Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED8A31946E8
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2020 20:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgCZTBX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Mar 2020 15:01:23 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:38088 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgCZTBW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 15:01:22 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QIxW9V107393;
        Thu, 26 Mar 2020 19:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=oAK443TCIuOJbk6QBvMmFzo6EdxAqCv7/vwccxEUNs4=;
 b=BLn43taSn7jrcCHgcpTaLtecEx/VSds+xgwfi/T+CEkNlmYlLfyMZD2G0G9yX5U18dFu
 mezBWalKG1s6YmhlkyJBmyId74ISZwf5bNCqhV5s9OzeUS7WJ369XGJUM31p4NZESCod
 7qpIiPHJ+Mv+pq5/EOv33HObPjn5aEYwCqyBcGxXCVwrtZVC+qloBivVUGfifIh416zp
 9Km/hKzAxWDf/6g7GJwdYbqtaTcTD47j8zht2F/g2p42ck8kPj+msacLnV/wdPjJZti5
 reRcdkkv6UzCMWbuSBi2MZnZdhXcqCf/fTxghM/NnjzF4FnTrGPQy9CUP8/pFJlQ+ymE CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2ywabrhq76-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 Mar 2020 19:01:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QIvsJN102856;
        Thu, 26 Mar 2020 19:01:03 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 3006r8y2us-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 Mar 2020 19:01:03 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02QJ11IV031631;
        Thu, 26 Mar 2020 19:01:01 GMT
Received: from tomti.i.net-space.pl (/10.175.206.254)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 26 Mar 2020 12:01:00 -0700
Date:   Thu, 26 Mar 2020 20:00:55 +0100
From:   Daniel Kiper <daniel.kiper@oracle.com>
To:     Ross Philipson <ross.philipson@oracle.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org, dpsmith@apertussolutions.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        trenchboot-devel@googlegroups.com
Subject: Re: [RFC PATCH 02/12] x86: Secure Launch main header file
Message-ID: <20200326190055.w54jyga4ygbuglzk@tomti.i.net-space.pl>
References: <20200325194317.526492-1-ross.philipson@oracle.com>
 <20200325194317.526492-3-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200325194317.526492-3-ross.philipson@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260141
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 25, 2020 at 03:43:07PM -0400, Ross Philipson wrote:
> Introduce the main Secure Launch header file used in the early SL stub
> and the early setup code.
>
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>  include/linux/slaunch.h | 513 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 513 insertions(+)
>  create mode 100644 include/linux/slaunch.h
>
> diff --git a/include/linux/slaunch.h b/include/linux/slaunch.h

This patch is arch specific and should land in arch/x86/include.

Hmmm... arch/x86/include/slaunch/txt.h?

> new file mode 100644
> index 000000000000..8f090dc38984
> --- /dev/null
> +++ b/include/linux/slaunch.h
> @@ -0,0 +1,513 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_SLAUNCH_H
> +#define _LINUX_SLAUNCH_H
> +
> +/*
> + * Secure Launch Defined State Flags
> + */
> +#define SL_FLAG_ACTIVE		0x00000001
> +#define SL_FLAG_ARCH_SKINIT	0x00000002
> +#define SL_FLAG_ARCH_TXT	0x00000004
> +
> +#ifdef CONFIG_SECURE_LAUNCH
> +
> +/*
> + * Secure Launch main definitions file.
> + *
> + * Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.

Copyright (c) 2020, Oracle and/or its affiliates.

...and IMO this header should go immediately behind SPDX header...

> + */
> +
> +#define __SL32_CS	0x0008
> +#define __SL32_DS	0x0010
> +
> +#define SL_CPU_AMD	1
> +#define SL_CPU_INTEL	2
> +
> +#define INTEL_CPUID_MFGID_EBX	0x756e6547 /* Genu */
> +#define INTEL_CPUID_MFGID_EDX	0x49656e69 /* ineI */
> +#define INTEL_CPUID_MFGID_ECX	0x6c65746e /* ntel */

Could not we add this to more generic header?

> +#define AMD_CPUID_MFGID_EBX	0x68747541 /* Auth */
> +#define AMD_CPUID_MFGID_EDX	0x69746e65 /* enti */
> +#define AMD_CPUID_MFGID_ECX	0x444d4163 /* cAMD */

Do we need AMD stuff if we do not add it in this patchset?

> +/*
> + * Intel Safer Mode Extensions (SMX)
> + *
> + * Intel SMX provides a programming interface to establish a Measured Launched
> + * Environment (MLE). The measurement and protection mechanisms supported by the
> + * capabilities of an Intel Trusted Execution Technology (TXT) platform. SMX is
> + * the processor’s programming interface in an Intel TXT platform.
> + *
> + * See Intel SDM Volume 2 - 6.1 "Safer Mode Extensions Reference"
> + */
> +
> +/*
> + * SMX GETSEC Leaf Functions
> + */
> +#define SMX_X86_GETSEC_SEXIT	5
> +#define SMX_X86_GETSEC_SMCTRL	7
> +#define SMX_X86_GETSEC_WAKEUP	8
> +
> +/*
> + * Intel Trusted Execution Technology MMIO Registers Banks
> + */
> +#define TXT_PUB_CONFIG_REGS_BASE	0xfed30000
> +#define TXT_PRIV_CONFIG_REGS_BASE	0xfed20000
> +#define TXT_NR_CONFIG_PAGES     ((TXT_PUB_CONFIG_REGS_BASE - \
> +				  TXT_PRIV_CONFIG_REGS_BASE) >> PAGE_SHIFT)
> +
> +/*
> + * Intel Trusted Execution Technology (TXT) Registers
> + */
> +#define TXT_CR_STS			0x0000
> +#define TXT_CR_ESTS			0x0008
> +#define TXT_CR_ERRORCODE		0x0030
> +#define TXT_CR_CMD_RESET		0x0038
> +#define TXT_CR_CMD_CLOSE_PRIVATE	0x0048
> +#define TXT_CR_DIDVID			0x0110
> +#define TXT_CR_CMD_UNLOCK_MEM_CONFIG	0x0218
> +#define TXT_CR_SINIT_BASE		0x0270
> +#define TXT_CR_SINIT_SIZE		0x0278
> +#define TXT_CR_MLE_JOIN			0x0290
> +#define TXT_CR_HEAP_BASE		0x0300
> +#define TXT_CR_HEAP_SIZE		0x0308
> +#define TXT_CR_CMD_OPEN_LOCALITY1	0x0380
> +#define TXT_CR_CMD_CLOSE_LOCALITY1	0x0388
> +#define TXT_CR_CMD_OPEN_LOCALITY2	0x0390
> +#define TXT_CR_CMD_CLOSE_LOCALITY2	0x0398
> +#define TXT_CR_CMD_SECRETS		0x08e0
> +#define TXT_CR_CMD_NO_SECRETS		0x08e8
> +#define TXT_CR_E2STS			0x08f0
> +
> +/* TXTCR_STS status bits */
> +#define TXT_SENTER_DONE_STS		(1<<0)
> +#define TXT_SEXIT_DONE_STS		(1<<1)

s/TXT_SENTER_DONE_STS/TXT_STS_SENTER_DONE/
s/TXT_SEXIT_DONE_STS/TXT_STS__SEXIT_DONE/

> +
> +/*
> + * SINIT/MLE Capabilities Field Bit Definitions
> + */
> +#define TXT_SINIT_MLE_CAP_WAKE_GETSEC	0
> +#define TXT_SINIT_MLE_CAP_WAKE_MONITOR	1
> +
> +/*
> + * OS/MLE Secure Launch Specific Definitions
> + */
> +#define TXT_MAX_EVENT_LOG_SIZE		(5*4*1024)   /* 4k*5 */
> +#define TXT_MAX_VARIABLE_MTRRS		32
> +#define TXT_OS_MLE_STRUCT_VERSION	1
> +
> +/*
> + * TXT Heap Table Enumeration
> + */
> +#define TXT_BIOS_DATA_TABLE		1
> +#define TXT_OS_MLE_DATA_TABLE		2
> +#define TXT_OS_SINIT_DATA_TABLE		3
> +#define TXT_SINIT_MLE_DATA_TABLE	4

s/TXT_BIOS_DATA_TABLE/TXT_DATA_TABLE_BIOS/ etc.

> +/*
> + * Secure Launch Defined Error Codes used in MLE-initiated TXT resets.
> + *
> + * TXT Specification
> + * Appendix I ACM Error Codes
> + */
> +#define SL_ERROR_GENERIC		0xc0008001
> +#define SL_ERROR_TPM_INIT		0xc0008002
> +#define SL_ERROR_TPM_INVALID_LOG20	0xc0008003
> +#define SL_ERROR_TPM_LOGGING_FAILED	0xc0008004
> +#define SL_ERROR_TPM_GET_LOC		0xc0008005
> +#define SL_ERROR_TPM_EXTEND		0xc0008006
> +#define SL_ERROR_MTRR_INV_VCNT		0xc0008007
> +#define SL_ERROR_MTRR_INV_DEF_TYPE	0xc0008008
> +#define SL_ERROR_MTRR_INV_BASE		0xc0008009
> +#define SL_ERROR_MTRR_INV_MASK		0xc000800a
> +#define SL_ERROR_MSR_INV_MISC_EN	0xc000800b
> +#define SL_ERROR_INV_AP_INTERRUPT	0xc000800c
> +#define SL_ERROR_RESERVE_AP_WAKE	0xc000800d
> +#define SL_ERROR_HEAP_WALK		0xc000800e
> +#define SL_ERROR_HEAP_MAP		0xc000800f
> +#define SL_ERROR_HEAP_MDR_VALS		0xc0008010
> +#define SL_ERROR_HEAP_INVALID_DMAR	0xc0008011
> +#define SL_ERROR_HEAP_DMAR_SIZE		0xc0008012
> +#define SL_ERROR_HEAP_DMAR_MAP		0xc0008013
> +#define SL_ERROR_HI_PMR_BASE		0xc0008014
> +#define SL_ERROR_HI_PMR_SIZE		0xc0008015
> +#define SL_ERROR_LO_PMR_BASE		0xc0008016
> +#define SL_ERROR_LO_PMR_MLE		0xc0008017
> +#define SL_ERROR_HEAP_ZERO_OFFSET	0xc0008018
> +
> +/*
> + * Secure Launch Defined Limits
> + */
> +#define TXT_MAX_CPUS		512
> +#define TXT_BOOT_STACK_SIZE	24
> +
> +/*
> + * Secure Launch event log entry type. The TXT specification defines the
> + * base event value as 0x400 for DRTM values.
> + */
> +#define TXT_EVTYPE_BASE		0x400
> +#define TXT_EVTYPE_SLAUNCH	(TXT_EVTYPE_BASE + 0x102)
> +
> +/*
> + * Measured Launch PCRs
> + */
> +#define SL_IMAGE_PCR17		17
> +#define SL_CONFIG_PCR18		18
> +
> +/*
> + * MLE scratch area offsets
> + */

I think that you can you use one line, e.g. /* MLE scratch area offsets */
here, below and above...

> +#define SL_SCRATCH_AP_EBP		0
> +#define SL_SCRATCH_AP_JMP_OFFSET	4
> +
> +#ifndef __ASSEMBLY__
> +
> +/*
> + * Secure Launch AP wakeup information fetched in SMP boot code.
> + */

Ditto...

> +struct sl_ap_wake_info {
> +	u64 ap_wake_block;
> +	u32 ap_jmp_offset;
> +};
> +
> +/*
> + * TXT heap extended data elements.
> + */

Ditto... Etc...

> +struct txt_heap_ext_data_element {
> +	u32 type;
> +	u32 size;
> +	/* Data */
> +} __packed;
> +
> +#define TXT_HEAP_EXTDATA_TYPE_END			0
> +
> +struct txt_heap_end_element {
> +	u32 type;
> +	u32 size;
> +} __packed;
> +
> +#define TXT_HEAP_EXTDATA_TYPE_TPM_EVENT_LOG_PTR		5
> +
> +struct txt_heap_event_log_element {
> +	u64 event_log_phys_addr;
> +} __packed;
> +
> +#define TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1	8
> +
> +struct txt_heap_event_log_pointer2_1_element {
> +	u64 phys_addr;
> +	u32 allocated_event_container_size;
> +	u32 first_record_offset;
> +	u32 next_record_offset;
> +} __packed;
> +
> +/*
> + * Secure Launch defined MTRR saving structures
> + */
> +struct txt_mtrr_pair {
> +	u64 mtrr_physbase;
> +	u64 mtrr_physmask;
> +} __packed;
> +
> +struct txt_mtrr_state {
> +	u64 default_mem_type;
> +	u64 mtrr_vcnt;
> +	struct txt_mtrr_pair mtrr_pair[TXT_MAX_VARIABLE_MTRRS];
> +} __packed;
> +
> +/*
> + * Secure Launch defined OS/MLE TXT Heap table
> + */
> +struct txt_os_mle_data {
> +	u32 version;
> +	u32 zero_page_addr;

I think that you should change zero_page_addr to boot_params_addr.
boot_params sounds more generic and I can imagine that there can be an
different implementation of Intel TXT MLE kernel than Linux one. So, IMO
naming in this structure should be as much generic as possible.

> +	u8 msb_key_hash[20];
> +	u64 saved_misc_enable_msr;
> +	struct txt_mtrr_state saved_bsp_mtrrs;
> +	u64 ap_wake_block;
> +	/* These two fields should always be last */

Hmmm... What if you want to bump version number and extend this
structure with new members?

> +	u64 mle_scratch;
> +	u8 event_log_buffer[TXT_MAX_EVENT_LOG_SIZE];

This should be a pointer to a TPM event log. On TXT heap?
And of course another member with its size.

> +} __packed;
> +
> +/*
> + * TXT specification defined BIOS data TXT Heap table
> + */
> +struct txt_bios_data {
> +	u32 version; /* Currently 5 for TPM 1.2 and 6 for TPM 2.0 */
> +	u32 bios_sinit_size;
> +	u64 reserved1;
> +	u64 reserved2;
> +	u32 num_logical_procs;
> +	/* Versions >= 5 with updates in version 6 */
> +	u32 sinit_flags;
> +	u32 mle_flags;
> +	/* Versions >= 4 */
> +	/* Ext Data Elements */
> +} __packed;
> +
> +/*
> + * TXT specification defined OS/SINIT TXT Heap table
> + */
> +struct txt_os_sinit_data {
> +	u32 version; /* Currently 6 for TPM 1.2 and 7 for TPM 2.0 */
> +	u32 flags;
> +	u64 mle_ptab;
> +	u64 mle_size;
> +	u64 mle_hdr_base;
> +	u64 vtd_pmr_lo_base;
> +	u64 vtd_pmr_lo_size;
> +	u64 vtd_pmr_hi_base;
> +	u64 vtd_pmr_hi_size;
> +	u64 lcp_po_base;
> +	u64 lcp_po_size;
> +	u32 capabilities;
> +	/* Version = 5 */
> +	u64 efi_rsdt_ptr;
> +	/* Versions >= 6 */
> +	/* Ext Data Elements */
> +} __packed;
> +
> +/*
> + * TXT specification defined SINIT/MLE TXT Heap table
> + */
> +struct txt_sinit_mle_data {
> +	u32 version;             /* Current values are 6 through 9 */
> +	/* Versions <= 8 */
> +	u8 bios_acm_id[20];
> +	u32 edx_senter_flags;
> +	u64 mseg_valid;
> +	u8 sinit_hash[20];
> +	u8 mle_hash[20];
> +	u8 stm_hash[20];
> +	u8 lcp_policy_hash[20];
> +	u32 lcp_policy_control;
> +	/* Versions >= 7 */
> +	u32 rlp_wakeup_addr;
> +	u32 reserved;
> +	u32 num_of_sinit_mdrs;
> +	u32 sinit_mdrs_table_offset;
> +	u32 sinit_vtd_dmar_table_size;
> +	u32 sinit_vtd_dmar_table_offset;
> +	/* Versions >= 8 */
> +	u32 processor_scrtm_status;
> +	/* Versions >= 9 */
> +	/* Ext Data Elements */
> +} __packed;
> +
> +/*
> + * TXT data reporting structure for memory types
> + */
> +struct txt_sinit_memory_descriptor_record {
> +	u64 address;
> +	u64 length;
> +	u8 type;
> +	u8 reserved[7];
> +} __packed;
> +
> +/*
> + * TXT data structure used by a responsive local processor (RLP) to start
> + * execution in response to a GETSEC[WAKEUP].
> + */
> +struct smx_rlp_mle_join {
> +	u32 rlp_gdt_limit;
> +	u32 rlp_gdt_base;
> +	u32 rlp_seg_sel;     /* cs (ds, es, ss are seg_sel+8) */
> +	u32 rlp_entry_point; /* phys addr */
> +} __packed;
> +
> +/*
> + * TPM event log structures defined in both the TXT specification and
> + * the TCG documentation.
> + */
> +#define TPM12_EVTLOG_SIGNATURE "TXT Event Container"
> +
> +struct tpm12_event_log_header {
> +	char signature[20];
> +	char reserved[12];
> +	u8 container_ver_major;
> +	u8 container_ver_minor;
> +	u8 pcr_event_ver_major;
> +	u8 pcr_event_ver_minor;
> +	u32 container_size;
> +	u32 pcr_events_offset;
> +	u32 next_event_offset;
> +	/* PCREvents[] */
> +} __packed;
> +
> +struct tpm12_pcr_event {
> +	u32 pcr_index;
> +	u32 type;
> +	u8 digest[20];
> +	u32 size;
> +	/* Data[] */
> +} __packed;
> +
> +#define TPM20_EVTLOG_SIGNATURE "Spec ID Event03"
> +
> +struct tpm20_ha {
> +	u16 algorithm_id;
> +	/* digest[AlgorithmID_DIGEST_SIZE] */

I suppose that you do somewhere weird arithmetic to get digest offset.
Why not digest[0] or digest[]? Then you can refer to this member
directly then...

> +} __packed;
> +
> +struct tpm20_digest_values {
> +	u32 count;
> +	/* TPMT_HA digests[count] */

Ditto and below...

> +} __packed;
> +
> +struct tpm20_pcr_event_head {
> +	u32 pcr_index;
> +	u32 event_type;
> +} __packed;
> +
> +/* Variable size array of hashes in the tpm20_digest_values structure */
> +
> +struct tpm20_pcr_event_tail {
> +	u32 event_size;
> +	/* Event[EventSize]; */
> +} __packed;
> +
> +#include <linux/io.h>

I would prefer to move this immediately behind "#ifndef __ASSEMBLY__"...

> +/*
> + * Functions to extract data from the Intel TXT Heap Memory
> + */
> +static inline u64 txt_bios_data_size(void *heap)
> +{
> +	return *((u64 *)heap);
> +}
> +
> +static inline void *txt_bios_data_start(void *heap)
> +{
> +	return heap + sizeof(u64);
> +}
> +
> +static inline u64 txt_os_mle_data_size(void *heap)
> +{
> +	return *((u64 *)(heap + txt_bios_data_size(heap)));
> +}
> +
> +static inline void *txt_os_mle_data_start(void *heap)
> +{
> +	return heap + txt_bios_data_size(heap) + sizeof(u64);
> +}
> +
> +static inline u64 txt_os_sinit_data_size(void *heap)
> +{
> +	return *((u64 *)(heap + txt_bios_data_size(heap) +
> +			txt_os_mle_data_size(heap)));
> +}
> +
> +static inline void *txt_os_sinit_data_start(void *heap)
> +{
> +	return heap + txt_bios_data_size(heap) +
> +		txt_os_mle_data_size(heap) + sizeof(u64);
> +}
> +
> +static inline u64 txt_sinit_mle_data_size(void *heap)
> +{
> +	return *((u64 *)(heap + txt_bios_data_size(heap) +
> +			txt_os_mle_data_size(heap) +
> +			txt_os_sinit_data_size(heap)));
> +}
> +
> +static inline void *txt_sinit_mle_data_start(void *heap)
> +{
> +	return heap + txt_bios_data_size(heap) +
> +		txt_os_mle_data_size(heap) +
> +		txt_sinit_mle_data_size(heap) + sizeof(u64);
> +}
> +
> +/*
> + * TPM event logging functions.
> + */
> +static inline struct txt_heap_event_log_pointer2_1_element*
> +tpm20_find_log2_1_element(struct txt_os_sinit_data *os_sinit_data)

Naming suggests that these TPM functions are generic ones. However,
they are not. They are TXT specific. Could you prefix them with "txt_"?

> +{
> +	struct txt_heap_ext_data_element *ext_elem;
> +
> +	/* The extended element array as at the end of this table */
> +	ext_elem = (struct txt_heap_ext_data_element *)
> +		((u8 *)os_sinit_data + sizeof(struct txt_os_sinit_data));
> +
> +	while (ext_elem->type != TXT_HEAP_EXTDATA_TYPE_END) {
> +		if (ext_elem->type ==
> +		    TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1) {
> +			return (struct txt_heap_event_log_pointer2_1_element *)
> +				((u8 *)ext_elem +
> +					sizeof(struct txt_heap_ext_data_element));
> +		}
> +		ext_elem =
> +			(struct txt_heap_ext_data_element *)
> +			((u8 *)ext_elem + ext_elem->size);
> +	}
> +
> +	return NULL;
> +}
> +
> +static inline int tpm12_log_event(void *evtlog_base,
> +				  u32 event_size, void *event)

Ditto...

> +{
> +	struct tpm12_event_log_header *evtlog =
> +		(struct tpm12_event_log_header *)evtlog_base;
> +
> +	if (memcmp(evtlog->signature, TPM12_EVTLOG_SIGNATURE,
> +		   sizeof(TPM12_EVTLOG_SIGNATURE)))
> +		return -EINVAL;
> +
> +	if (evtlog->next_event_offset + event_size > evtlog->container_size)
> +		return -E2BIG;
> +
> +	memcpy(evtlog_base + evtlog->next_event_offset, event, event_size);
> +	evtlog->next_event_offset += event_size;
> +
> +	return 0;
> +}
> +
> +static inline int tpm20_log_event(struct txt_heap_event_log_pointer2_1_element *elem,
> +				  void *evtlog_base,
> +				  u32 event_size, void *event)

Ditto...

Daniel
