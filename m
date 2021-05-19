Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06D338855C
	for <lists+linux-doc@lfdr.de>; Wed, 19 May 2021 05:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhESDhi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 May 2021 23:37:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:58230 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbhESDhi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 23:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1621395378; x=1652931378;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=T928rnrPgluU0UhJVYwE+uScXpesaiL3M/ku4yQib5o=;
  b=Q0untvEF73n7ZhRcZNStTaVcrpMUPuAwNRuioxU6sKE/HFXRoiuwcTSd
   134M5TwM7vKNmC7L6SOBHl42qIOQXut4en4KQERu9loh+gPjyi8EQvY+y
   AgcaZv6Ast5x4PzcZXFR2aLF6TuPc8UNEwFHCi08rXGPlNWUbCKsE+Wvl
   ZqVbTKTzVmf7MvXMtT8eNhTkm+ugFGvqcbGl+6O5f0t6m1YQaYZFQlTDD
   chIIebjv+iC2TXDF85rwFXlz/R6iPp3+LiMCBhjdkUs6o9MUFvzwWGGZU
   o6Wpd+QsMoABfOwFwx/oknOKAgpTOxasfxlRJMa6cU5dPicHNa2goR1zt
   g==;
IronPort-SDR: Mmv8cqc1Sa1u0CoESzgHz7Pcz6sDJcwX1wdQpG3uvk1LhkgJA8THTgEscF0kTqw+NEILugeOPl
 3SI6AHnnULwETpJTaFVYa2fNEscJXMzpp9G5qEjwXwA8xmgQX5uZ4CkLBjOTW+NULM5js2/Ma1
 ioXFxX0uGiF80XL4k2fynJA19YTFDn45wATxpiiEikMc1Kkt3T5c+OGv39Ebp0PHfAMI7TMRkn
 VYsHsxtYPNZ3pIs/ytiT5UxNtD97/+OeLwPR4Ria84EsvTg53FZd+mVV+wbAMUoYzG4hLKrSrr
 ipw=
X-IronPort-AV: E=Sophos;i="5.82,311,1613404800"; 
   d="scan'208";a="168652736"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 19 May 2021 11:36:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBKQgGs4bZXWRtwqvUizVIcHOfja1rmnWPlWuk2bHGHlWfRJ8aprALZuR5vp+zaPRCpafDDlvZByScrLibzWo/t8oWh+4BoPBJUaLq+pPlkR1SgQWmVd01Gyht57qf3qsLZLoBEx9NutT3pOVchk/Mok1SBKxu6pMjQITF3YmU5cIe4VB6rS1frtosgqLFN8l2r9zd2kqSL0O/e1xpbcsoAkvrbHPyJmgshleHn/CxMgzEjk3PA9tG8x39/TwgvM6eaTGCdOsCKT5z9jIHY4q3sM6ao0DcANV3ofdiXiMAA5Gjf0DsqYlC8u3gNlruoSFd99eQNDTvDiGKxfvmYOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osCqAPJkD6g0ggfoqkXxp+33qJgrlILQhlCFsEQHuOw=;
 b=a6CQs/Z6FBpyck0oVVVf6BWdr/BVKFOW2eVog1LJvN4KWxqIwRIe/kG/WVwhAVkVa05eKENr+ilBR4IRhCd6w1qLiUpVjEjqT0lS7d3Em3Sh5D8OlGbPL6ygBrEjEIrtL/mhoEyDjvGCiryiGxKdGG4A+ojcPTqe+Q7PHwNp9d6EFFkdrE7VEgEQo8x9TthJcAgkeLy8GsPs4pZsRZqUQewyho31dMNv8kfiZGkvJSowqbHfTVIMLshoQIiBUMsBfgHH30cKKoaFmtanqeVJqI7gO+pFYr27yOpylK6SPO9v7y/1MVKmtZa2FBWGBWGIEzv6i1r1u3sEgjSzqVCjnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osCqAPJkD6g0ggfoqkXxp+33qJgrlILQhlCFsEQHuOw=;
 b=q75CcJUXKLGyg/NGiV8f/jrwUMD1YcTVq1StXl/m5yJvdO7vujN1s7XHcd+ij3vz45Tea46uaVHEtZdzCG95wjv90smFQaD7BT1+AN1JOg0S73usFXrTxjl2P5vgUoFFhPVWqZqNPRy+ztq2a4MFZxuK2+uM5RfjDKuumQ9vxg8=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7761.namprd04.prod.outlook.com (2603:10b6:5:35f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 03:36:17 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 03:36:17 +0000
From:   Anup Patel <anup.patel@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexander Graf <graf@amazon.com>,
        Atish Patra <atish.patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v18 00/18] KVM RISC-V Support
Date:   Wed, 19 May 2021 09:05:35 +0530
Message-Id: <20210519033553.1110536-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.179.32.148]
X-ClientProxiedBy: MA1PR0101CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.32.148) by MA1PR0101CA0057.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 03:36:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19c427e5-1a3c-4f75-851d-08d91a774295
X-MS-TrafficTypeDiagnostic: CO6PR04MB7761:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB776105746584F190CBE24E878D2B9@CO6PR04MB7761.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqqhZJuMomzu2AE3I2OeAwVQ1uqPblNe1SbZ89PiJZhbD/dKCmv4qKTWQOejPwzEakd4L3cVnGEuUpWTsioaF4OSaSFZmdfQ+cjIA5yb+dA30c2RsT088tONtidTCycf1pQyAe6XmBypMGmAKyOsJeVUtkzgJtCkd4oDJcG6mbZe76IJuLZkpShEgVCx2AOi7K8R2qhevNteEA5MAJtk/HERZPtp99peV8T/XpBSvnkqwgYEdlnBuLcTg7/on48BAgGt5VbRIu2jGLDdhTc4rmk8FVmQwsZBKe+AcXF1w9qZINs41LHIGtkGY4UjHVrqoUjjM7d3opfyWPPq6Pu+xgKpeIpQuM6X7So+KzPYv305JXY6Oct50aCmDUwvkI/dlXUmLauAMh+EqyfWwSMv9j1Qx2LsEWw4VoCZizuoxq4H3ikNNBSXE+JXnmCIxqAz20yLQZ0c9FDN7nKbL+lnB4jdqSQfxGFjydJWZnUwgWV3NaBwbuRKWV6Ss4b0j0QLod4QClX73LMsLx03wrAx/wiRGvoaO25+0uT+ypRtPUaz07qPNjD0Z9qRbgi69mb10kIvmQvBLWNPHLeh2J1bPIyZjxq7XF8+tS+snqw8bd1FsS9pd4Klrz8Qg1MW/VjIi7t/OxhuCGJpHjuHrCPmpdMPKtadWYU8y3og6kco4TDNmJSKJMbfB9cdhlydmsDQB4lwZmnf7mDEFX5HEOU4GIqLKGDYir3eEaJcIPJ4+15GSMSeLbMllNwJp86FB/LiUqnnk3gq26auAMenn3DmQXuVYTobZpFYJoljW8QuLJGKiTW3x2HmuSEX9dq/OVWFJTAA8WNhp16wSbLE8wj8YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7812.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(316002)(38350700002)(55016002)(38100700002)(66476007)(66946007)(1076003)(2616005)(186003)(5660300002)(4326008)(26005)(8936002)(478600001)(86362001)(2906002)(52116002)(7696005)(16526019)(110136005)(83380400001)(8676002)(6666004)(966005)(66556008)(36756003)(30864003)(7416002)(956004)(54906003)(44832011)(8886007)(42580500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DpUQKgaoij+kk5lQnaEXtmQ32O6VMRSPoC6S3R2qzKiUTurq11Zigm7nQRjU?=
 =?us-ascii?Q?Ll4MEZLHBfuEv/3cvA5vrd+mvlDyB/zG+/vRxak+iIYMuhEfZDusplX24LkI?=
 =?us-ascii?Q?C/hON3hkH/6CSLdXeO9K5b872F2OaYU1FJRo9KtPwDvmUVzTfb+EJkq7/H4/?=
 =?us-ascii?Q?gF8dIb6yzLBWjVcNN0fjsvHDyO3hC4sc01uoTddGmKwiF8WPNIWRcDMmmTdi?=
 =?us-ascii?Q?J3+KrpHZrlyTgyc1PJHHUy5jXTaZe9pEJXbY5kPW5mb/0Jx0uVSbmJaPnIrw?=
 =?us-ascii?Q?d/kWX5OTX/VPSUvrMfAFtKU79MMlmia2BcgH7lpRMDMTj74gR9i5OAfppbUf?=
 =?us-ascii?Q?nA+oH6i+3RRav84WEAjTmjRrMUo9MpUjOE0gEbpvd8xMacCw45T3AYVeci25?=
 =?us-ascii?Q?jJbzOJ7MccxYKOP+RhFUHEathwO7vI1aI5+DMxQ9asPf7dcfSSiOO3SXfLGi?=
 =?us-ascii?Q?EO3EW1+0O4yWjKPJT9U+tTlnqS2lFQT5tYSIQ9IiyEgvLnZWSOPh8qgTNpds?=
 =?us-ascii?Q?DU5KnTK2OajSl0vpTQiQjTYQ+0kgTcHE118v4wnZNz2rxj8ZU00Tc2idwjUN?=
 =?us-ascii?Q?FcmTSIVPI7JfTiGVmNWsNP4dIkp6JeNdVtEdxu7R2mvgBPFun9HjBzqpaIn8?=
 =?us-ascii?Q?f4wwpBxGMRDm1475Fh2Zt80fwYi7ay6k0noV+2w9C9BLaXV1jEczD+Da65tx?=
 =?us-ascii?Q?7WJ2duvcsg+5nzS5eVPs+dlLtc0eWXMctH72h/vu4Qstp97nzNnTlF8vbihQ?=
 =?us-ascii?Q?IezWdN1ijZKxchKIypBEl/BRFhLNocLJMS65nATIltleF+lCT4YYZZYs25Q+?=
 =?us-ascii?Q?/Mk8zIqEfFz3IbotHUhtik3Bs2+hoXfnQfd3wSFpk3Q7uAkfVNAZSqRzyZuO?=
 =?us-ascii?Q?lokypwrF1ycxVRIW1NTlgwmXhAMFQ1MavoKNxA+LTpdoSeoCnQJV4ce+1FiB?=
 =?us-ascii?Q?ukO+dOBSIbA3SBl93lLwStVI3EKGK9e1qfR74zD2CL+TzGffzFGBAecoqPxC?=
 =?us-ascii?Q?h4X3ELJMYmPmolFUSFZZJsRtiT3M+9OzC85svO6jMXkfunI2+qs1F3W+gqxp?=
 =?us-ascii?Q?FyAuUN908oC4A3ai7oFizVz0z1AJtq52bibDP8wKgass+wmb8THBhYtMIai4?=
 =?us-ascii?Q?io7ABXfGwIdtXFRhH8/Pfd/MmUWwWs7XAd+xy69ofXlJaNK+n4WR4aMyA2l0?=
 =?us-ascii?Q?izUkiKYf3w1WyEq+9d2b8nT7KedSE1qySA/VK58C+SKF2aiLUn5Xn9P7Gvc6?=
 =?us-ascii?Q?Pugl1z4r0p22YwqDHVQcaG4q/srA4X/tmFWlxzPutJ9kqC0/dAJlqdtpp0iG?=
 =?us-ascii?Q?DSjcEjrmeus8iCcEQPKUhebI?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c427e5-1a3c-4f75-851d-08d91a774295
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 03:36:17.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG6fRhosZzNrfa0x8RaNCilb/XBCTuDv1DxoRxlg/NtN5HV6rxegn6DLSX7Ka6e1OeTxbL/2ZiRbMF5hDNdVMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7761
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Anup Patel <anup@brainfault.org>

This series adds initial KVM RISC-V support. Currently, we are able to boot
Linux on RV64/RV32 Guest with multiple VCPUs.

Key aspects of KVM RISC-V added by this series are:
1. No RISC-V specific KVM IOCTL
2. Minimal possible KVM world-switch which touches only GPRs and few CSRs
3. Both RV64 and RV32 host supported
4. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
5. KVM ONE_REG interface for VCPU register access from user-space
6. PLIC emulation is done in user-space
7. Timer and IPI emuation is done in-kernel
8. Both Sv39x4 and Sv48x4 supported for RV64 host
9. MMU notifiers supported
10. Generic dirtylog supported
11. FP lazy save/restore supported
12. SBI v0.1 emulation for KVM Guest available
13. Forward unhandled SBI calls to KVM userspace
14. Hugepage support for Guest/VM
15. IOEVENTFD support for Vhost

Here's a brief TODO list which we will work upon after this series:
1. SBI v0.2 emulation in-kernel
2. SBI v0.2 hart state management emulation in-kernel
3. In-kernel PLIC emulation
4. ..... and more .....

This series can be found in riscv_kvm_v18 branch at:
https//github.com/avpatel/linux.git

Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v7 branch
at: https//github.com/avpatel/kvmtool.git

The QEMU RISC-V hypervisor emulation is done by Alistair and is available
in master branch at: https://git.qemu.org/git/qemu.git

To play around with KVM RISC-V, refer KVM RISC-V wiki at:
https://github.com/kvm-riscv/howto/wiki
https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike

Changes since v17:
 - Rebased on Linux-5.13-rc2
 - Moved to new KVM MMU notifier APIs
 - Removed redundant kvm_arch_vcpu_uninit()
 - Moved KVM RISC-V sources to drivers/staging for compliance with
   Linux RISC-V patch acceptance policy

Changes since v16:
 - Rebased on Linux-5.12-rc5
 - Remove redundant kvm_arch_create_memslot(), kvm_arch_vcpu_setup(),
   kvm_arch_vcpu_init(), kvm_arch_has_vcpu_debugfs(), and
   kvm_arch_create_vcpu_debugfs() from PATCH5
 - Make stage2_wp_memory_region() and stage2_ioremap() as static
   in PATCH13

Changes since v15:
 - Rebased on Linux-5.11-rc3
 - Fixed kvm_stage2_map() to use gfn_to_pfn_prot() for determing
   writeability of a host pfn.
 - Use "__u64" in-place of "u64" and "__u32" in-place of "u32" for
   uapi/asm/kvm.h

Changes since v14:
 - Rebased on Linux-5.10-rc3
 - Fixed Stage2 (G-stage) PDG allocation to ensure it is 16KB aligned

Changes since v13:
 - Rebased on Linux-5.9-rc3
 - Fixed kvm_riscv_vcpu_set_reg_csr() for SIP updation in PATCH5
 - Fixed instruction length computation in PATCH7
 - Added ioeventfd support in PATCH7
 - Ensure HSTATUS.SPVP is set to correct value before using HLV/HSV
   intructions in PATCH7
 - Fixed stage2_map_page() to set PTE 'A' and 'D' bits correctly
   in PATCH10
 - Added stage2 dirty page logging in PATCH10
 - Allow KVM user-space to SET/GET SCOUNTER CSR in PATCH5
 - Save/restore SCOUNTEREN in PATCH6
 - Reduced quite a few instructions for __kvm_riscv_switch_to() by
   using CSR swap instruction in PATCH6
 - Detect and use Sv48x4 when available in PATCH10

Changes since v12:
 - Rebased patches on Linux-5.8-rc4
 - By default enable all counters in HCOUNTEREN
 - RISC-V H-Extension v0.6.1 spec support

Changes since v11:
 - Rebased patches on Linux-5.7-rc3
 - Fixed typo in typecast of stage2_map_size define
 - Introduced struct kvm_cpu_trap to represent trap details and
   use it as function parameter wherever applicable
 - Pass memslot to kvm_riscv_stage2_map() for supporing dirty page
   logging in future
 - RISC-V H-Extension v0.6 spec support
 - Send-out first three patches as separate series so that it can
   be taken by Palmer for Linux RISC-V

Changes since v10:
 - Rebased patches on Linux-5.6-rc5
 - Reduce RISCV_ISA_EXT_MAX from 256 to 64
 - Separate PATCH for removing N-extension related defines
 - Added comments as requested by Palmer
 - Fixed HIDELEG CSR programming

Changes since v9:
 - Rebased patches on Linux-5.5-rc3
 - Squash PATCH19 and PATCH20 into PATCH5
 - Squash PATCH18 into PATCH11
 - Squash PATCH17 into PATCH16
 - Added ONE_REG interface for VCPU timer in PATCH13
 - Use HTIMEDELTA for VCPU timer in PATCH13
 - Updated KVM RISC-V mailing list in MAINTAINERS entry
 - Update KVM kconfig option to depend on RISCV_SBI and MMU
 - Check for SBI v0.2 and SBI v0.2 RFENCE extension at boot-time
 - Use SBI v0.2 RFENCE extension in VMID implementation
 - Use SBI v0.2 RFENCE extension in Stage2 MMU implementation
 - Use SBI v0.2 RFENCE extension in SBI implementation
 - Moved to RISC-V Hypervisor v0.5 draft spec
 - Updated Documentation/virt/kvm/api.txt for timer ONE_REG interface

Changes since v8:
 - Rebased series on Linux-5.4-rc3 and Atish's SBI v0.2 patches
 - Use HRTIMER_MODE_REL instead of HRTIMER_MODE_ABS in timer emulation
 - Fixed kvm_riscv_stage2_map() to handle hugepages
 - Added patch to forward unhandled SBI calls to user-space
 - Added patch for iterative/recursive stage2 page table programming
 - Added patch to remove per-CPU vsip_shadow variable
 - Added patch to fix race-condition in kvm_riscv_vcpu_sync_interrupts()

Changes since v7:
 - Rebased series on Linux-5.4-rc1 and Atish's SBI v0.2 patches
 - Removed PATCH1, PATCH3, and PATCH20 because these already merged
 - Use kernel doc style comments for ISA bitmap functions
 - Don't parse X, Y, and Z extension in riscv_fill_hwcap() because it will
   be added in-future
 - Mark KVM RISC-V kconfig option as EXPERIMENTAL
 - Typo fix in commit description of PATCH6 of v7 series
 - Use separate structs for CORE and CSR registers of ONE_REG interface
 - Explicitly include asm/sbi.h in kvm/vcpu_sbi.c
 - Removed implicit switch-case fall-through in kvm_riscv_vcpu_exit()
 - No need to set VSSTATUS.MXR bit in kvm_riscv_vcpu_unpriv_read()
 - Removed register for instruction length in kvm_riscv_vcpu_unpriv_read()
 - Added defines for checking/decoding instruction length
 - Added separate patch to forward unhandled SBI calls to userspace tool

Changes since v6:
 - Rebased patches on Linux-5.3-rc7
 - Added "return_handled" in struct kvm_mmio_decode to ensure that
   kvm_riscv_vcpu_mmio_return() updates SEPC only once
 - Removed trap_stval parameter from kvm_riscv_vcpu_unpriv_read()
 - Updated git repo URL in MAINTAINERS entry

Changes since v5:
 - Renamed KVM_REG_RISCV_CONFIG_TIMEBASE register to
   KVM_REG_RISCV_CONFIG_TBFREQ register in ONE_REG interface
 - Update SPEC in kvm_riscv_vcpu_mmio_return() for MMIO exits
 - Use switch case instead of illegal instruction opcode table for simplicity
 - Improve comments in stage2_remote_tlb_flush() for a potential remote TLB
  flush optimization
 - Handle all unsupported SBI calls in default case of
   kvm_riscv_vcpu_sbi_ecall() function
 - Fixed kvm_riscv_vcpu_sync_interrupts() for software interrupts
 - Improved unprivilege reads to handle traps due to Guest stage1 page table
 - Added separate patch to document RISC-V specific things in
   Documentation/virt/kvm/api.txt

Changes since v4:
 - Rebased patches on Linux-5.3-rc5
 - Added Paolo's Acked-by and Reviewed-by
 - Updated mailing list in MAINTAINERS entry

Changes since v3:
 - Moved patch for ISA bitmap from KVM prep series to this series
 - Make vsip_shadow as run-time percpu variable instead of compile-time
 - Flush Guest TLBs on all Host CPUs whenever we run-out of VMIDs

Changes since v2:
 - Removed references of KVM_REQ_IRQ_PENDING from all patches
 - Use kvm->srcu within in-kernel KVM run loop
 - Added percpu vsip_shadow to track last value programmed in VSIP CSR
 - Added comments about irqs_pending and irqs_pending_mask
 - Used kvm_arch_vcpu_runnable() in-place-of kvm_riscv_vcpu_has_interrupt()
   in system_opcode_insn()
 - Removed unwanted smp_wmb() in kvm_riscv_stage2_vmid_update()
 - Use kvm_flush_remote_tlbs() in kvm_riscv_stage2_vmid_update()
 - Use READ_ONCE() in kvm_riscv_stage2_update_hgatp() for vmid

Changes since v1:
 - Fixed compile errors in building KVM RISC-V as module
 - Removed unused kvm_riscv_halt_guest() and kvm_riscv_resume_guest()
 - Set KVM_CAP_SYNC_MMU capability only after MMU notifiers are implemented
 - Made vmid_version as unsigned long instead of atomic
 - Renamed KVM_REQ_UPDATE_PGTBL to KVM_REQ_UPDATE_HGATP
 - Renamed kvm_riscv_stage2_update_pgtbl() to kvm_riscv_stage2_update_hgatp()
 - Configure HIDELEG and HEDELEG in kvm_arch_hardware_enable()
 - Updated ONE_REG interface for CSR access to user-space
 - Removed irqs_pending_lock and use atomic bitops instead
 - Added separate patch for FP ONE_REG interface
 - Added separate patch for updating MAINTAINERS file

Anup Patel (14):
  RISC-V: Add hypervisor extension related CSR defines
  RISC-V: Add initial skeletal KVM support
  RISC-V: KVM: Implement VCPU create, init and destroy functions
  RISC-V: KVM: Implement VCPU interrupts and requests handling
  RISC-V: KVM: Implement KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctls
  RISC-V: KVM: Implement VCPU world-switch
  RISC-V: KVM: Handle MMIO exits for VCPU
  RISC-V: KVM: Handle WFI exits for VCPU
  RISC-V: KVM: Implement VMID allocator
  RISC-V: KVM: Implement stage2 page table programming
  RISC-V: KVM: Implement MMU notifiers
  RISC-V: KVM: Document RISC-V specific parts of KVM API
  RISC-V: KVM: Move sources to drivers/staging directory
  RISC-V: KVM: Add MAINTAINERS entry

Atish Patra (4):
  RISC-V: KVM: Add timer functionality
  RISC-V: KVM: FP lazy save/restore
  RISC-V: KVM: Implement ONE REG interface for FP registers
  RISC-V: KVM: Add SBI v0.1 support

 Documentation/virt/kvm/api.rst                | 193 +++-
 MAINTAINERS                                   |  11 +
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/Makefile                           |   1 +
 arch/riscv/include/uapi/asm/kvm.h             | 128 +++
 drivers/clocksource/timer-riscv.c             |   9 +
 drivers/staging/riscv/kvm/Kconfig             |  36 +
 drivers/staging/riscv/kvm/Makefile            |  23 +
 drivers/staging/riscv/kvm/asm/kvm_csr.h       | 105 ++
 drivers/staging/riscv/kvm/asm/kvm_host.h      | 271 +++++
 drivers/staging/riscv/kvm/asm/kvm_types.h     |   7 +
 .../staging/riscv/kvm/asm/kvm_vcpu_timer.h    |  44 +
 drivers/staging/riscv/kvm/main.c              | 118 +++
 drivers/staging/riscv/kvm/mmu.c               | 802 ++++++++++++++
 drivers/staging/riscv/kvm/riscv_offsets.c     | 170 +++
 drivers/staging/riscv/kvm/tlb.S               |  74 ++
 drivers/staging/riscv/kvm/vcpu.c              | 997 ++++++++++++++++++
 drivers/staging/riscv/kvm/vcpu_exit.c         | 701 ++++++++++++
 drivers/staging/riscv/kvm/vcpu_sbi.c          | 173 +++
 drivers/staging/riscv/kvm/vcpu_switch.S       | 401 +++++++
 drivers/staging/riscv/kvm/vcpu_timer.c        | 225 ++++
 drivers/staging/riscv/kvm/vm.c                |  81 ++
 drivers/staging/riscv/kvm/vmid.c              | 120 +++
 include/clocksource/timer-riscv.h             |  16 +
 include/uapi/linux/kvm.h                      |   8 +
 25 files changed, 4706 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/kvm.h
 create mode 100644 drivers/staging/riscv/kvm/Kconfig
 create mode 100644 drivers/staging/riscv/kvm/Makefile
 create mode 100644 drivers/staging/riscv/kvm/asm/kvm_csr.h
 create mode 100644 drivers/staging/riscv/kvm/asm/kvm_host.h
 create mode 100644 drivers/staging/riscv/kvm/asm/kvm_types.h
 create mode 100644 drivers/staging/riscv/kvm/asm/kvm_vcpu_timer.h
 create mode 100644 drivers/staging/riscv/kvm/main.c
 create mode 100644 drivers/staging/riscv/kvm/mmu.c
 create mode 100644 drivers/staging/riscv/kvm/riscv_offsets.c
 create mode 100644 drivers/staging/riscv/kvm/tlb.S
 create mode 100644 drivers/staging/riscv/kvm/vcpu.c
 create mode 100644 drivers/staging/riscv/kvm/vcpu_exit.c
 create mode 100644 drivers/staging/riscv/kvm/vcpu_sbi.c
 create mode 100644 drivers/staging/riscv/kvm/vcpu_switch.S
 create mode 100644 drivers/staging/riscv/kvm/vcpu_timer.c
 create mode 100644 drivers/staging/riscv/kvm/vm.c
 create mode 100644 drivers/staging/riscv/kvm/vmid.c
 create mode 100644 include/clocksource/timer-riscv.h

-- 
2.25.1

