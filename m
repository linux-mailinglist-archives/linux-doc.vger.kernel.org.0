Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D71CA1087F0
	for <lists+linux-doc@lfdr.de>; Mon, 25 Nov 2019 05:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfKYEiW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 24 Nov 2019 23:38:22 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:33733 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfKYEiW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Nov 2019 23:38:22 -0500
Received: by mail-ua1-f67.google.com with SMTP id a13so3978101uaq.0
        for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2019 20:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ODOWzCRi043ffNDsCloDhETkDx/3yHGIPaI98O2FMPs=;
        b=scvgPzoCtzyBStjnpu0uaIipErr0VPNdDVsoPSGcTB3pLbmZBGpAvQQpmuTtBpPVjR
         dblKyltOpUaUiARw2uNxSszOk0gcYweZwgEYZdhFhpTgeSUlBjvotFBbSSIKIvO/xteY
         bEM3rsrSlWFk5Ci8qpvOxMWWSqkLSEuTF8//nAHMCYGIPgJB1mm7SG8TUletH2/e7KHO
         vXzRF3LQBh8OLVmwACT1BJG6PvsKVgzpNa5cX2IJTb0ZoYJEpWdBtfj3o5hVAw3hO399
         WhYUa4Ak0SDy49w+E8zpc6KQbmdRQO4WQde7JTh1cOrcTDGPFkgcCNnPaUofBH4KIxxH
         wLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ODOWzCRi043ffNDsCloDhETkDx/3yHGIPaI98O2FMPs=;
        b=c2kSRsvGnLjmw/VBY8KuOR0N740aR9jGapvN480kcCvPgFyYN0irWYt2U4df4jkbYd
         Z7tfmS7p6VxcZElzPK9w6mpSwzInyn00wx+eP2T7L1qNlvSqma2A2IPx5EsWGpRocrly
         pvdBh4qpSbvAhVv9uSXwSxUZXPpUo01ROu51vX3awhzN/PH8Yt7NTeprv71Ok1MATsYF
         GqDwOeafFGByIn1ol7ZIJ48R9JMMEVKJxCDnblkh1KlxxuWm3e5uXElcfpR9v8YqFQ/X
         d+0gHAvQJsRK92+4YxnxoJtBogzcVGyLEUMkdycG8XLhCvw+s6F/GFjxkO5xNEqpdqY+
         E3Dg==
X-Gm-Message-State: APjAAAUPAhH8t3DAv+rLPTaOMX0TsQAgt69zYAZ9VDLCU6gwrmc+UMnc
        R2wJtyvo6aYx/CzWzJmVuU5law==
X-Google-Smtp-Source: APXvYqxl1QyKCrZPFicOQjVqEOmLrlpZOu2p50f+Qa1nPOOOUqzbUl693vAEJXbgb7m3Lqaateq9eA==
X-Received: by 2002:ab0:1602:: with SMTP id k2mr16755271uae.103.1574656701027;
        Sun, 24 Nov 2019 20:38:21 -0800 (PST)
Received: from ubuntu1804-desktop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id v202sm1665911vke.52.2019.11.24.20.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 20:38:20 -0800 (PST)
Date:   Sun, 24 Nov 2019 23:38:20 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org
Subject: [RFC v2 1/2] docs: ftrace: Clarify the RAM impact of buffer_size_kb
Message-ID: <2c8f88a60637bef6fa7d58089ff54011c1671b0e.1574655670.git.frank@generalsoftwareinc.com>
References: <cover.1574655670.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1574655670.git.frank@generalsoftwareinc.com>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current text could mislead the user into believing that the number
of pages allocated by each CPU ring buffer is calculated by the round
up of the division: buffer_size_kb / PAGE_SIZE.

Clarifies that a few extra pages may be allocated to accommodate buffer
management meta-data.

Suggested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Suggested-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Frank A. Cancio Bello <frank@generalsoftwareinc.com>
---
 Documentation/trace/ftrace.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index d2b5657ed33e..2b21068ebf8e 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -185,7 +185,8 @@ of ftrace. Here is a list of some of the key files:
 	CPU buffer and not total size of all buffers. The
 	trace buffers are allocated in pages (blocks of memory
 	that the kernel uses for allocation, usually 4 KB in size).
-	If the last page allocated has room for more bytes
+	A few extra pages may be allocated to accommodate buffer management
+        meta-data. If the last page allocated has room for more bytes
 	than requested, the rest of the page will be used,
 	making the actual allocation bigger than requested or shown.
 	( Note, the size may not be a multiple of the page size
-- 
2.17.1

