Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968A212A3C3
	for <lists+linux-doc@lfdr.de>; Tue, 24 Dec 2019 18:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfLXR6D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Dec 2019 12:58:03 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:32925 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfLXR6D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Dec 2019 12:58:03 -0500
Received: by mail-vs1-f66.google.com with SMTP id n27so12911837vsa.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2019 09:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4E/2wqIKz28ubvLgIUjPVPO4AakvBg1lZqS8m4r8eSs=;
        b=m1C17E2OCbrBxPWsStlDbBdxv+Mec3R9l1v327xokY5ED1DsMOOK5Puqfo1rAJTOYm
         Qv+GbzC84M/Fl4FVcW3NqxTf5o9Gm/ciKO3/Txg5Me67QoBfkjJajoqAHfh+J5lYt//X
         bv2LS3Jp4l5BmIS0gaHsmGJSQ/j64VnwwQKh6R4ZuFyJIUgkfdBqCbjyXCRY7MiHj9gK
         TsQcs1bYWMksDA26ht5eGZLzm+844Cm5Usn/3UtwD+xJURHE4k+C7LUBD/n2iAjwsZkQ
         Rh8nL6dDXlLsto4b0BG8LxT6txv4OG1PPtHF8gfr0iv6GwYxwrGkwz19BBYK+pIETIv4
         vBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4E/2wqIKz28ubvLgIUjPVPO4AakvBg1lZqS8m4r8eSs=;
        b=BcQKPE0dC8YdJUsXcLfbVbE2MkC58vGTLVpjAMs5BU9NRk4szTqBlpNsooSVlS+k+f
         grK7EZuvZnSYnMeqAdXiVgy3LCb1dFrwIFsUO6KMzez9QLaH9/pNgwZXrVGOBHUA8yPs
         cqe1CVePg7DTlC+xtKLrO8OfK9o29M6ThuYxLG9EoXE0chHJmyRh5fpPcKoiTZswFHEA
         fhTaxs4Qp1CYL/50UGkLVBxbli2ab5HYWHB9VdDf9KnXWYebn0RXtRTnxxSZhnDGe71g
         L7g2h7YJ1KU7oSi5OjM6+SPDC7z/KMK9MuFQ3Fu6ypE2sGxFeBlY8ydqNUfg6OfHPLo9
         xOYQ==
X-Gm-Message-State: APjAAAUG0haEf2NYNCGf5Xhl5ba0HXkKed48U3n3L39nbb0xKy8QdJoq
        TpKc7lIfE5/tt3Xz1BRuoNAAtA==
X-Google-Smtp-Source: APXvYqzQ5q0W/JmxBU9sfGZwjw/cQSHLYkcHenfYpw5U/6kJszxvgxeQoHzU5nDQ4T5fkdRmvTc2Cw==
X-Received: by 2002:a05:6102:52e:: with SMTP id m14mr20331835vsa.25.1577210280987;
        Tue, 24 Dec 2019 09:58:00 -0800 (PST)
Received: from frank-laptop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id w125sm7079066vkh.50.2019.12.24.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 09:58:00 -0800 (PST)
Date:   Tue, 24 Dec 2019 12:58:00 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org,
        nachukannan@gmail.com
Subject: [PATCH 3/3] docs: ftrace: Fix small notation mistake
Message-ID: <9624d6fb140cf4a6752f37590cdf670eff68a18e.1577209218.git.frank@generalsoftwareinc.com>
References: <cover.1577209218.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1577209218.git.frank@generalsoftwareinc.com>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The use of iff ("if and only if") notation is not accurate in this case.

Suggested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Frank A. Cancio Bello <frank@generalsoftwareinc.com>
---
 Documentation/trace/ring-buffer-design.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/ring-buffer-design.txt b/Documentation/trace/ring-buffer-design.txt
index ff747b6fa39b..2d53c6f25b91 100644
--- a/Documentation/trace/ring-buffer-design.txt
+++ b/Documentation/trace/ring-buffer-design.txt
@@ -37,7 +37,7 @@ commit_page - a pointer to the page with the last finished non-nested write.
 
 cmpxchg - hardware-assisted atomic transaction that performs the following:
 
-   A = B iff previous A == C
+   A = B if previous A == C
 
    R = cmpxchg(A, C, B) is saying that we replace A with B if and only if
       current A is equal to C, and we put the old (current) A into R
-- 
2.17.1

