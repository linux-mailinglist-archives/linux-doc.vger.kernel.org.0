Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B3F7BF8DC
	for <lists+linux-doc@lfdr.de>; Tue, 10 Oct 2023 12:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjJJKmg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Oct 2023 06:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjJJKmf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 06:42:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF73A9;
        Tue, 10 Oct 2023 03:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696934553; x=1728470553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mM3AiJiagGzGr2K1qyArsgdrP2OTqU1JfVLnVKHdQiY=;
  b=Q2Rqt1Al8kybLMh/iUGu3eRXDzLGEpXpVuvYIp74PPEdVBWTC0f6Qu7s
   LJ60+g3YPqgMY0pfntfFkDTXRVT1eGr+EaDKmuYuJiSYLdulmJFwrWR0q
   U1ysin4onTUcFC7TXIhTTAfXfyumCo4D9rkvjqKV5ZUYb8ZEQ2GKAzb2l
   VZofMDzfPhjKsSZLeeYV8nmVaTb/SLLBSUqpzUvsQ6KASLHx6IUCH6gmR
   6jXCaM+JF/TpUAO647ZHfwYo8a2d9ejKnb6lNFuLTXScv3a5DBAMalMMS
   d7cl5/u7iKWFwuvWBq6vVaZ5ilTMOPpJDXrQLV6xODPPaSW97jwZ2wlTg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387199302"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387199302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 03:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="897132624"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="897132624"
Received: from asalaman-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.213.16.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 03:40:45 -0700
From:   Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To:     fenghua.yu@intel.com, reinette.chatre@intel.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, corbet@lwn.net
Cc:     x86@kernel.org, hpa@zytor.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, ilpo.jarvinen@linux.intel.com
Subject: [PATCH v5 0/4] x86/resctrl: Non-contiguous bitmasks in Intel CAT
Date:   Tue, 10 Oct 2023 12:42:10 +0200
Message-ID: <cover.1696934091.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Until recently Intel CPUs didn't support using non-contiguous 1s
in Cache Allocation Technology (CAT). Writing a bitmask with
non-contiguous 1s to the resctrl schemata file would fail.

Intel CPUs that support non-contiguous 1s can be identified through a
CPUID leaf mentioned in the "Intel® 64 and IA-32 Architectures
Software Developer’s Manual" document available at:
https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html

Add kernel support for detecting if non-contiguous 1s in Cache
Allocation Technology (CAT) are supported by the hardware. Also add a
new resctrl FS file to output this information to the userspace.
Keep the hardcoded value for Haswell CPUs only since they do not have
CPUID enumeration support for Cache allocation.

Unify variable names to match the "bitmask" convention rather than the
"bitmap" one to ensure consistency.

Since the selftests/resctrl files are going through many rewrites and
cleanups the appropriate selftest is still a work in progress. For
basic selftesting capabilities use the bash script attached below this
paragraph. It checks whether various bitmasks written into resctrl FS
generate output consistent with reported feature support.

#!/bin/bash
# must be run as root, depends on a recent cpuid tool (20230406 or later)
# variables
RESCTRL_INFO="/sys/fs/resctrl/info"
L3_NON_CONT_VAL="${RESCTRL_INFO}/L3/sparse_masks"
L2_NON_CONT_VAL="${RESCTRL_INFO}/L2/sparse_masks"
L3_NON_CONT_CBM="${RESCTRL_INFO}/L3/cbm_mask"
L2_NON_CONT_CBM="${RESCTRL_INFO}/L2/cbm_mask"
L3_CPUID_CMD="cpuid -1 -l 0x10 -s 0x01"
L2_CPUID_CMD="cpuid -1 -l 0x10 -s 0x02"
PASSED_TESTS=0
L3_SUPPORT=0
L2_SUPPORT=0
TESTS=0

run_test() {
        # L2 or L3
        CACHE_LEVEL=$1
        CACHE_LEVEL_SUPPORT="${CACHE_LEVEL}_SUPPORT"
        echo "Checking ${RESCTRL_INFO}/${CACHE_LEVEL}..."
        if [[ -d "${RESCTRL_INFO}/${CACHE_LEVEL}" ]]; then
                eval "${CACHE_LEVEL_SUPPORT}=1"
                echo "${CACHE_LEVEL} CAT Feature is supported"
        else
                echo "${CACHE_LEVEL} CAT Feature is not supported"
        fi

        if [[ ${!CACHE_LEVEL_SUPPORT} -eq 1 ]]; then
                echo " --- Running tests for ${CACHE_LEVEL} CAT ---"

                # read sysfs entries
                # are non-contiguous cbm supported? (driver sysfs)
                eval "NON_CONT_VAL=${CACHE_LEVEL}_NON_CONT_VAL"
                eval "NON_CONT_FEAT=$( cat ${!NON_CONT_VAL} )"

                # are non-contiguous cbm supported? (cpuid)
                CACHE_CPUID_CMD="${CACHE_LEVEL}_CPUID_CMD"
                NONCONT_CPUID=$(${!CACHE_CPUID_CMD} | grep non-contiguous | grep true)
                NONCONT_CPUID_RET=$(( !$? ))

                # what is the mask size?
                eval "NON_CONT_CBM=${CACHE_LEVEL}_NON_CONT_CBM"
                MAX_MASK=$(( 16#$( cat ${!NON_CONT_CBM} ) ))

                # prepare contiguous and non-contiguous masks for tests
                BC_STRING="l(${MAX_MASK})/l(2)"
                MAX_MASK_BIT_COUNT=$(echo ${BC_STRING} | bc -l)
                MAX_MASK_BIT_COUNT=$(printf "%.0f" "$MAX_MASK_BIT_COUNT")
                BITSHIFT=$(( $MAX_MASK_BIT_COUNT/2 - ($MAX_MASK_BIT_COUNT/2 % 4) ))
                CONT_MASK=$(( $MAX_MASK >> $BITSHIFT ))
                NONCONT_MASK=$(( ~( $MAX_MASK & ( 15<<$BITSHIFT) ) ))
                NONCONT_MASK=$(( $NONCONT_MASK & $MAX_MASK ))

                # test if cpuid reported support matches the sysfs one
                echo " * Testing if CPUID matches ${CACHE_LEVEL}/sparse_masks..."
                TESTS=$((TESTS + 1))
                if [[ $NONCONT_CPUID_RET -eq $NON_CONT_FEAT ]]; then
                        PASSED_TESTS=$((PASSED_TESTS + 1))
                        echo "There is a match!"
                else
                        echo "Error - no match!"
                fi

                # test by writing CBMs to the schemata
                printf " * Writing 0x%x mask to the schemata...\n" ${CONT_MASK}
                TESTS=$((TESTS + 1))
                SCHEMATA=$(printf "${CACHE_LEVEL}:0=%x" $CONT_MASK)
                echo "$SCHEMATA" > /sys/fs/resctrl/schemata
                if [[ $? -eq 0 ]]; then
                        PASSED_TESTS=$((PASSED_TESTS + 1))
                        echo "Contiguous ${CACHE_LEVEL} write correct!"
                else
                        echo "Contiguous ${CACHE_LEVEL} write ERROR!"
                fi

                printf " * Writing 0x%x mask to the schemata...\n" ${NONCONT_MASK}
                TESTS=$((TESTS + 1))
                SCHEMATA=$(printf "${CACHE_LEVEL}:0=%x" $NONCONT_MASK)
                echo "$SCHEMATA" > /sys/fs/resctrl/schemata
                if [[ (($? -eq 0) && ($NON_CONT_FEAT -eq 1)) || \
                        (($? -ne 0) && ($NON_CONT_FEAT -eq 0)) ]]; then
                        PASSED_TESTS=$((PASSED_TESTS + 1))
                        echo "Non-contiguous ${CACHE_LEVEL} write correct!"
                else
                        echo "Non-contiguous ${CACHE_LEVEL} write ERROR!"
                fi
        fi
}

# mount resctrl
mount -t resctrl resctrl /sys/fs/resctrl

run_test L3
run_test L2

echo "TESTS PASSED / ALL TESTS : ${PASSED_TESTS} / ${TESTS}"

# unmount resctrl
umount /sys/fs/resctrl

The series is based on tip/master branch.

Changelog v5:
- Rephrase patch messages (patches 1/4 and 2/4) according to Borislav's
  comments on Babu's [1] series.
- Remove redundant message paragraph from patch 4/4.
- Rebase onto tip/master.
- Add Babu's reviewed-by tags.

Changelog v4:
- Add Ilpo's reviewed-by tags.
- Add Reinette's reviewed-by tags.
- Reorder tags in alignment with maintainer-tip.rst.

Changelog v3:
- Add Peter's tested-by and reviewed-by tags.
- Change patch order to make 4th one the 1st.
- Add error checking to schema_len variable.
- Update cover letter since now the feature has moved from the SDM.

Changelog v2:
- Change git signature from Wieczor-Retman Maciej to Maciej
  Wieczor-Retman.
- Change bitmap naming convention to bit mask.
- Add patch to change arch_has_sparce_bitmaps name to match bitmask
  naming convention.

[1] https://lore.kernel.org/all/20231003235430.1231238-1-babu.moger@amd.com/

Fenghua Yu (2):
  x86/resctrl: Add sparse_masks file in info
  Documentation/x86: Document resctrl's new sparse_masks

Maciej Wieczor-Retman (2):
  x86/resctrl: Rename arch_has_sparse_bitmaps
  x86/resctrl: Enable non-contiguous CBMs in Intel CAT

 Documentation/arch/x86/resctrl.rst        | 16 ++++++++++++----
 arch/x86/kernel/cpu/resctrl/core.c        | 11 +++++++----
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 14 ++++++++------
 arch/x86/kernel/cpu/resctrl/internal.h    |  9 +++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 18 ++++++++++++++++++
 include/linux/resctrl.h                   |  4 ++--
 6 files changed, 56 insertions(+), 16 deletions(-)


base-commit: ef19bc9dddc3727dec1efa08683f658b1f4b7b78
-- 
2.42.0

