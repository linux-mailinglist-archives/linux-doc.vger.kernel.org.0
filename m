Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A36D780B01
	for <lists+linux-doc@lfdr.de>; Fri, 18 Aug 2023 13:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376595AbjHRLV0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Aug 2023 07:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376640AbjHRLVV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 07:21:21 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24F383AB2;
        Fri, 18 Aug 2023 04:21:20 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CBC3D75;
        Fri, 18 Aug 2023 04:22:00 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.55.189])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A7B13F762;
        Fri, 18 Aug 2023 04:21:15 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V4 3/3] Documentation: coresight: Add cc_threshold tunable
Date:   Fri, 18 Aug 2023 16:50:51 +0530
Message-Id: <20230818112051.594986-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230818112051.594986-1-anshuman.khandual@arm.com>
References: <20230818112051.594986-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This updates config option to include 'cc_threshold' tunable value.

Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/trace/coresight/coresight.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 4a71ea6cb390..ce55adb80b82 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -624,6 +624,10 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
    * - timestamp
      - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
        <coresight-timestamp>`
+   * - cc_threshold
+     - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
+       default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
+       value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
 
 How to use the STM module
 -------------------------
-- 
2.25.1

