Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10C5601E94
	for <lists+linux-doc@lfdr.de>; Tue, 18 Oct 2022 02:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbiJRAL1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Oct 2022 20:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiJRAKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 20:10:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D14870B9;
        Mon, 17 Oct 2022 17:08:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E1B8E612FD;
        Tue, 18 Oct 2022 00:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996F9C433D7;
        Tue, 18 Oct 2022 00:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666051727;
        bh=8F8gsq3wEiSLz7ZdSR0nDtrQ/AqYVXz1uWIv+7VrN44=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IG1l6ZdYITWzoU/W45fJGOSSiqMkyXyrHt3BG6dWBdNcWlNIlryyvodh8oYjc9+Sd
         q+/+eSP7su3AvKcXds6yHB2gr1+vbWubRqd6xzuWydQf/PswLNvoYiEE5seoApbJjp
         jIr9gm/JFaWnPJ/wAF+G4EB5OG3LLJ+dty+RyHkp7AQVU865J0DiK5VSU1OA1CZPmx
         u+suhPjospsvbFeQL1OCnlqrAV+BHI5gi6qKRaJHL0cDAX1pa6mDyRYcb8Wtx5llfh
         9kTinbF5EbyfHoiAJGJUiUjyXxueFP64eL7FyYiBKe9wH7rSERRU1AUSEcu9DOb8ol
         SrvAmsKvhDxpg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jacky Li <jackyli@google.com>, Peter Gonda <pgonda@google.com>,
        Alper Gun <alpergun@google.com>,
        David Rientjes <rientjes@google.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Sasha Levin <sashal@kernel.org>, pbonzini@redhat.com,
        corbet@lwn.net, brijesh.singh@amd.com, john.allen@amd.com,
        davem@davemloft.net, like.xu.linux@gmail.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 03/29] crypto: ccp - Initialize PSP when reading psp data file failed
Date:   Mon, 17 Oct 2022 20:08:12 -0400
Message-Id: <20221018000839.2730954-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000839.2730954-1-sashal@kernel.org>
References: <20221018000839.2730954-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jacky Li <jackyli@google.com>

[ Upstream commit d8da2da21fdb1f5964c11c00f0cc84fb0edf31d0 ]

Currently the OS fails the PSP initialization when the file specified at
'init_ex_path' does not exist or has invalid content. However the SEV
spec just requires users to allocate 32KB of 0xFF in the file, which can
be taken care of by the OS easily.

To improve the robustness during the PSP init, leverage the retry
mechanism and continue the init process:

Before the first INIT_EX call, if the content is invalid or missing,
continue the process by feeding those contents into PSP instead of
aborting. PSP will then override it with 32KB 0xFF and return
SEV_RET_SECURE_DATA_INVALID status code. In the second INIT_EX call,
this 32KB 0xFF content will then be fed and PSP will write the valid
data to the file.

In order to do this, sev_read_init_ex_file should only be called once
for the first INIT_EX call. Calling it again for the second INIT_EX call
will cause the invalid file content overwriting the valid 32KB 0xFF data
provided by PSP in the first INIT_EX call.

Co-developed-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Jacky Li <jackyli@google.com>
Reported-by: Alper Gun <alpergun@google.com>
Acked-by: David Rientjes <rientjes@google.com>
Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../virt/kvm/x86/amd-memory-encryption.rst    |  5 ++-
 drivers/crypto/ccp/sev-dev.c                  | 36 +++++++++++--------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index 2d307811978c..935aaeb97fe6 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -89,9 +89,8 @@ context. In a typical workflow, this command should be the first command issued.
 
 The firmware can be initialized either by using its own non-volatile storage or
 the OS can manage the NV storage for the firmware using the module parameter
-``init_ex_path``. The file specified by ``init_ex_path`` must exist. To create
-a new NV storage file allocate the file with 32KB bytes of 0xFF as required by
-the SEV spec.
+``init_ex_path``. If the file specified by ``init_ex_path`` does not exist or
+is invalid, the OS will create or override the file with output from PSP.
 
 Returns: 0 on success, -negative on error
 
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index b292641c8a99..8512101f0bdf 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -211,18 +211,24 @@ static int sev_read_init_ex_file(void)
 	if (IS_ERR(fp)) {
 		int ret = PTR_ERR(fp);
 
-		dev_err(sev->dev,
-			"SEV: could not open %s for read, error %d\n",
-			init_ex_path, ret);
+		if (ret == -ENOENT) {
+			dev_info(sev->dev,
+				"SEV: %s does not exist and will be created later.\n",
+				init_ex_path);
+			ret = 0;
+		} else {
+			dev_err(sev->dev,
+				"SEV: could not open %s for read, error %d\n",
+				init_ex_path, ret);
+		}
 		return ret;
 	}
 
 	nread = kernel_read(fp, sev_init_ex_buffer, NV_LENGTH, NULL);
 	if (nread != NV_LENGTH) {
-		dev_err(sev->dev,
-			"SEV: failed to read %u bytes to non volatile memory area, ret %ld\n",
+		dev_info(sev->dev,
+			"SEV: could not read %u bytes to non volatile memory area, ret %ld\n",
 			NV_LENGTH, nread);
-		return -EIO;
 	}
 
 	dev_dbg(sev->dev, "SEV: read %ld bytes from NV file\n", nread);
@@ -410,17 +416,12 @@ static int __sev_init_locked(int *error)
 static int __sev_init_ex_locked(int *error)
 {
 	struct sev_data_init_ex data;
-	int ret;
 
 	memset(&data, 0, sizeof(data));
 	data.length = sizeof(data);
 	data.nv_address = __psp_pa(sev_init_ex_buffer);
 	data.nv_len = NV_LENGTH;
 
-	ret = sev_read_init_ex_file();
-	if (ret)
-		return ret;
-
 	if (sev_es_tmr) {
 		/*
 		 * Do not include the encryption mask on the physical
@@ -439,7 +440,7 @@ static int __sev_platform_init_locked(int *error)
 {
 	struct psp_device *psp = psp_master;
 	struct sev_device *sev;
-	int rc, psp_ret = -1;
+	int rc = 0, psp_ret = -1;
 	int (*init_function)(int *error);
 
 	if (!psp || !psp->sev_data)
@@ -450,8 +451,15 @@ static int __sev_platform_init_locked(int *error)
 	if (sev->state == SEV_STATE_INIT)
 		return 0;
 
-	init_function = sev_init_ex_buffer ? __sev_init_ex_locked :
-			__sev_init_locked;
+	if (sev_init_ex_buffer) {
+		init_function = __sev_init_ex_locked;
+		rc = sev_read_init_ex_file();
+		if (rc)
+			return rc;
+	} else {
+		init_function = __sev_init_locked;
+	}
+
 	rc = init_function(&psp_ret);
 	if (rc && psp_ret == SEV_RET_SECURE_DATA_INVALID) {
 		/*
-- 
2.35.1

