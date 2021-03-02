Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7A32A8F2
	for <lists+linux-doc@lfdr.de>; Tue,  2 Mar 2021 19:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580437AbhCBSDc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Mar 2021 13:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349756AbhCBRga (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 12:36:30 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F25AC061D7D
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 09:20:40 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id p21so14246820pgl.12
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LGedM16svrVRIDLBK09BZkJurYK/adPWABtIqUN11XE=;
        b=nec8Qf4JnqZveYNQRUt7giQ1HrgeOLBYYbLnenTVr1+XsPqLZx9H4T93/uPCFY99dV
         CvMWnXF0Q4e78JMkkeSHeqJPsj5AJYQG6dqcOu8prQgpDlsLk/2PM604XmGKLDS+H0Kv
         1LcC65OfH1Xt23i3jXtcGsdn8W0QFiP2u3piZAWQJ1rbHA1AwtvtqcOPEwMYwRvWFu28
         NEfIo+hOnGkj2ykivDKe08SuraOa0BgrsdkI3sdK3QYdQY2A9hUseVRfbfhhQpNKa6B2
         vHmEDzrQeOpaVV6PbmnpglsgtP6l5G8hAhgjdfLkV/uH9UiOAGniC4sqPl7yvWPmVncu
         HSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LGedM16svrVRIDLBK09BZkJurYK/adPWABtIqUN11XE=;
        b=kxsqWBb3cnkPj379A1cG+S8zCqRgKIvdeulnEDsIgxpf93/vynW1LvQtlOhoIyrP7Q
         CBnlwX/ZnpiVXb5uaIagC4qBsz0fZahCIJSqTIMvxYDEUJTyozqHEbe7JHkwBjIKDAya
         69njA6JB1CjVnc7nm0fD3SyiWF3LOiNlT+lc8/rp80+vA1dubOe2/SS5j2eV+ef2/s+x
         oPM+UK+P0OCMhSWQorjAWXgEuXRtE/LvKl32vH0jaxwJWryg2lr2EF0ZJMBpY2WFnlSs
         VtC7fyThGTAUAoNt4Y4u/DuGBG2x68U5HYMnw6Z+oajL6dUC3c0exmc9F/E+cq2wCHVO
         Gzew==
X-Gm-Message-State: AOAM530h/Zl5hhj4DIZWF4gFWcgorH7/X1E97YuejuC7UY9KY4Du8Em/
        xHGr9wvViFR6dWTxtG/hfgN4adel95lmAvDl
X-Google-Smtp-Source: ABdhPJx/uvf1QBj7cHKKClRTL89yGb95dwPDCdF0a63SosyR+2cPWBJqf5GeKY0fbP9QjO6nOPhTjA==
X-Received: by 2002:a05:6a00:22d6:b029:1cb:35ac:d8e0 with SMTP id f22-20020a056a0022d6b02901cb35acd8e0mr4023406pfj.17.1614705640111;
        Tue, 02 Mar 2021 09:20:40 -0800 (PST)
Received: from localhost.localdomain (c-73-93-5-123.hsd1.ca.comcast.net. [73.93.5.123])
        by smtp.gmail.com with ESMTPSA id b15sm20073923pgg.85.2021.03.02.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:20:39 -0800 (PST)
From:   Joe Stringer <joe@cilium.io>
To:     bpf@vger.kernel.org
Cc:     daniel@iogearbox.net, ast@kernel.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>
Subject: [PATCHv2 bpf-next 06/15] bpf: Document BPF_PROG_TEST_RUN syscall command
Date:   Tue,  2 Mar 2021 09:19:38 -0800
Message-Id: <20210302171947.2268128-7-joe@cilium.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302171947.2268128-1-joe@cilium.io>
References: <20210302171947.2268128-1-joe@cilium.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Based on a brief read of the corresponding source code.

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
Reviewed-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Joe Stringer <joe@cilium.io>
---
 include/uapi/linux/bpf.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index a8f2964ec885..a6cd6650e23d 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -306,14 +306,22 @@ union bpf_iter_link_info {
  *
  * BPF_PROG_TEST_RUN
  *	Description
- *		Run an eBPF program a number of times against a provided
- *		program context and return the modified program context and
- *		duration of the test run.
+ *		Run the eBPF program associated with the *prog_fd* a *repeat*
+ *		number of times against a provided program context *ctx_in* and
+ *		data *data_in*, and return the modified program context
+ *		*ctx_out*, *data_out* (for example, packet data), result of the
+ *		execution *retval*, and *duration* of the test run.
  *
  *	Return
  *		Returns zero on success. On error, -1 is returned and *errno*
  *		is set appropriately.
  *
+ *		**ENOSPC**
+ *			Either *data_size_out* or *ctx_size_out* is too small.
+ *		**ENOTSUPP**
+ *			This command is not supported by the program type of
+ *			the program referred to by *prog_fd*.
+ *
  * BPF_PROG_GET_NEXT_ID
  *	Description
  *		Fetch the next eBPF program currently loaded into the kernel.
-- 
2.27.0

