Return-Path: <linux-doc+bounces-1542-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 767137DD9A5
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 01:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF27B20F00
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 00:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B777373;
	Wed,  1 Nov 2023 00:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1TYgNLC"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B7836B
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 00:26:21 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAC6F9;
	Tue, 31 Oct 2023 17:26:20 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-359398abeb5so3515525ab.1;
        Tue, 31 Oct 2023 17:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698798380; x=1699403180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
        b=T1TYgNLCoHtu+HTPvUzm/RXPmmw0WoZzQx8QczSVib/S2OxXgHQDhyGx0QpuSxcGH7
         N7sgt1Afi1kHvYzkx7B22QL7uXlQn18I+iO9u2efuQ9JfboWHJHmYpR5MSjQCL0gVsoF
         8waLsryWKEQg0+lxIOtBm7T0ti1dOPcDb1U/9ussg5Kil7Af7U3J38YXbNDxqWZL9MN1
         kCyUxjSYFN2zLIJBgW6Vz391+XmI5tLZfjZSW1Fcv91KfeDwfcFNbxsm3I0fcVjcRyu1
         r15NT67zbCNqZSsKnX+eXeKGNVm4LlkqGw9kYsPgvHVeVPPPLmjXccEppUuCMa1Bq/v8
         KJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698798380; x=1699403180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
        b=M5QDo80nTaFKkvNpyn09XA42vTxkTX2Dpeyip3eBmC7p2F8tKdHdwgPreZdYnumhfF
         KpWub9doE/YzPs2hQ3ofJcGeO0HQz9ykT31/yN7mN5IU4ZZ4pCsVcvDtmpyo9F9bg89X
         qfORFnocIXxbNg4PE6LNNfUiD6CcTbHayqsPEZS6ynPcrISnlzxq6iYYlshaE4cRP3eq
         2Q79AblSd1F8r1FSxuU+WZFdPTYEUCKRKj7EtOf0oL1liFhgOV/TYeEVIBSyPS/mcOHl
         yVqD03C8JKBxD+mBl/jTeWsozNM4ljbHGNOe0R5eF9kIFJTm0xZHwjU46Io0sUhMvZtk
         DUAQ==
X-Gm-Message-State: AOJu0YxPsZ7iMyodnnvyQ6JHPSa/3C+xfQkwcSiiEQ6chZPpBsalKuHd
	VTOOfZJmxcdnMyIaWR3l+YIsMlRx03LdAQ==
X-Google-Smtp-Source: AGHT+IG5G7BowN3Rpu885onUhpHkQ9UETEZL9Zm3ofejMSXEUgMCUpUSTiNmvcnzK3Nf0uyP3Nh8FA==
X-Received: by 2002:a05:6e02:308d:b0:359:3ee6:a909 with SMTP id bf13-20020a056e02308d00b003593ee6a909mr2009828ilb.13.1698798380022;
        Tue, 31 Oct 2023 17:26:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:26:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: lb@semihalf.com,
	linux@rasmusvillemoes.dk,
	joe@perches.com,
	mcgrof@kernel.org,
	daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7d 02/23] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Tue, 31 Oct 2023 18:25:48 -0600
Message-ID: <20231101002609.3533731-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This appears in the control-file to report an unknown class-name, which
indicates that the class_id is not authorized, and dyndbg will ignore
changes to it.  Generally, this means that a DYNDBG_CLASSMAP_DEFINE or
DYNDBG_CLASSMAP_USE is missing.

But the word "unknown" appears in quite a few prdbg formats, so thats
a suboptimal search term to find occurrences of the problem.  Thus
change it to "_UNKNOWN_" which properly shouts the condition.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6fba6423cc10..ceb3067a5c83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.41.0


