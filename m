Return-Path: <linux-doc+bounces-9832-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4798385854A
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 19:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96651F23F9F
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 18:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB36D13958F;
	Fri, 16 Feb 2024 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="g5RWjmtE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390FB139581
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708108318; cv=none; b=nHqM8ibIbHU2yGuoASk2VLUBdK9txiq9W2KMOZq5W2SqDH2AuNpooH4GoT8q41K2hcRKmChkpGqphQlIeoEqCL36BMauRgHHE+OL+hFbeuiXhcx6y+gaPJC6G8W1muvH41nf4dW8cMM8UIQaJv3ZkggxRSN1K98PP/TXzWBjQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708108318; c=relaxed/simple;
	bh=cu3MMzOHuWJKImjKqYJ4/NXYAdw+8BhcKEGy95D0Imk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AqwYF7PfjOp3lLKVBTBBC/7DjI5qFY2FE1A3WTotlqCurPzq+cuXdHoo25andpC6DwxG/WH6BI22dfQAQfCZ3TCCkE88DG8ErbqTOGmyGsImOTX/X9kvn0lT2K2nKyf5xdPyyV0xOaZgzIycsjLWiZaQ+MouX+qpY2djiIy5uU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=g5RWjmtE; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68f111b9d92so13298996d6.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 10:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1708108316; x=1708713116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jDrn7wgy/ve0lPoR/xKtbF/cZLSIaETTt3wbkL2858=;
        b=g5RWjmtE4GeWFZAaV/uIOkmk7lxOE7p7YrGvVJmAcKzXvTzNblJIjIzroSJ1DZOx8s
         10g4s5s2oVoLfPMsw/ZdSlJcCRY/0V6duVc/nPqY+7wYUNTvLMH+bgC1ZNqZWi3hLG1Y
         Yg244tgwGgsbBZ1rcW/qjluZ+b7u7d335ytdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708108316; x=1708713116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jDrn7wgy/ve0lPoR/xKtbF/cZLSIaETTt3wbkL2858=;
        b=jcjhlFEz1dt1ma229BW0Spb+wMElvus4xgeG5/jo2bPLKi41GbtkfLryDjiA1cu49s
         qnrtrVvKeNVlh590f3HofRYSzq5TVS75MHHXS6T26lkAxwvMmndI4zPh/H6b+ePc8dnK
         KeTdYen4HvWcPI2eSjKarahxJAO9vcWghm2Z7l42YZrKYkASx6B7KXRGrjSwDBsbEHYe
         cBDh4EYoLYue9JEIWijTOn/tPZz5rxmyzCrgTidAJLHrra+26TcW5oqRzDgf1hPk+9JN
         SB1SuxCjg8G92A+r1m+yhLzLuPUi0hACTniLEpiqKtkPhCCS4/9xxsyb+vQ3TbvayFpp
         9fRg==
X-Forwarded-Encrypted: i=1; AJvYcCUxuHjBEsFmArMbTi5mG7yZZFtHLOhNpspsYDmjfS1ikRMml7TmifFT8SQKW4DEM4imKorIv09lSiONmthJTysc3AE+A4yTX2mo
X-Gm-Message-State: AOJu0Ywo/eaFX4DCqmeybPPZZBPcV2GMlroo18Fq90eW9yH+BhyRwl/c
	EnNGarmnzJVlxKTu/gerabpDPr/3QdvV+s568L1oCVgY1EAFGWoPoVN8cw50fY8=
X-Google-Smtp-Source: AGHT+IEMG/tv2++C9Upd1PzGPby/mwewGK3XuvH9GyHJN5ozTK/AseozSEHuW8OieKt6MmugUwdvUQ==
X-Received: by 2002:a0c:ca0f:0:b0:68f:144f:4c4 with SMTP id c15-20020a0cca0f000000b0068f144f04c4mr6750511qvk.37.1708108316068;
        Fri, 16 Feb 2024 10:31:56 -0800 (PST)
Received: from joelbox2.. (c-98-249-43-138.hsd1.va.comcast.net. [98.249.43.138])
        by smtp.gmail.com with ESMTPSA id nd13-20020a056214420d00b0068cdadb5e7esm159722qvb.31.2024.02.16.10.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 10:31:55 -0800 (PST)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Suleiman Souhlal <suleiman@google.com>,
	Youssef Esmat <youssefesmat@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	David Vernet <void@manifault.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	joseph.salisbury@canonical.com,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Phil Auld <pauld@redhat.com>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 09/10] admin-guide/hw-vuln: Correct prctl() argument description
Date: Fri, 16 Feb 2024 13:31:07 -0500
Message-Id: <20240216183108.1564958-10-joel@joelfernandes.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216183108.1564958-1-joel@joelfernandes.org>
References: <20240216183108.1564958-1-joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the description for arg4 which appears to be outdated.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 Documentation/admin-guide/hw-vuln/core-scheduling.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/core-scheduling.rst b/Documentation/admin-guide/hw-vuln/core-scheduling.rst
index cf1eeefdfc32..338d639a8127 100644
--- a/Documentation/admin-guide/hw-vuln/core-scheduling.rst
+++ b/Documentation/admin-guide/hw-vuln/core-scheduling.rst
@@ -62,8 +62,8 @@ arg3:
 
 arg4:
     ``pid_type`` for which the operation applies. It is one of
-    ``PR_SCHED_CORE_SCOPE_``-prefixed macro constants.  For example, if arg4
-    is ``PR_SCHED_CORE_SCOPE_THREAD_GROUP``, then the operation of this command
+    ``PIDTIME_``-prefixed macro constants.  For example, if arg4
+    is ``PIDTYPE_TGID``, then the operation of this command
     will be performed for all tasks in the task group of ``pid``.
 
 arg5:
-- 
2.34.1


