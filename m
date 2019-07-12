Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB72668BF
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2019 10:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfGLISt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 Jul 2019 04:18:49 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:51409 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfGLISn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Jul 2019 04:18:43 -0400
Received: by mail-qt1-f202.google.com with SMTP id m25so6284843qtn.18
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2019 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
        b=ajMvr06ssanFu9RH2ulwsIFgwcP3l/5lqWEJ4esAE7iplXyXRdoSrlII6lIzkciV9c
         8fS3nAoGa/HEi4KQyyTUBP5BR7yF3M+y9W97hSaSVNMs7BQDT5O+1ViXKXfznttmHdA4
         kZj77gRl1AQhpyhVrBktIROAMxvXbx6avdgvMOr4xBoGYGhyUIqfYD/dLpvgaPFXSOWO
         xbcNYLSdxlgrhAxlcEUApm2APOEsny1ZyIbfB8sr4BAZx09pOkCoMJnlgMX+1V3SASYs
         BSMIHfLGoKRYl/0WYsLgnjKM0J6KWHxKs/rp+Dqs7J9PUiYp83sE3bi0Q56vLyTXyarh
         dgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=LDQmGV1sXKMjUeOhPKTnD5bP1+GpH11oHwNBh3L4XLs=;
        b=rOULZ8QfLPMCGVf+1tKwOJZnF/sC143uH/SYc1Mk+vQgTOw3i/fDKgUoB1NTNMAKHn
         BSSRS/M60qfIFLL0vd7jjEhpEr/Z98n3qgziXBPiez8C5glH65b0qScGtaSJoJXGdBU/
         ruxDnh0XLtMBQL/F3birbnmjUWEQyFKI9WzAmvscqI4PAJ/9NuZptFX2RL5K0PKkKx11
         +tu19XVlb0BmbkCSgUfu8I2TmDpc/L3nd21bkxMuZj+VAENdM3hJmn74Nr/S/w4pJVBi
         OXv4q6s7gRNJTE6qYkJ5IbhI3e/79doItYThyLxEUOdmxsX+hwB6CX+qkGHgFTkHcx97
         aCAQ==
X-Gm-Message-State: APjAAAV+k2aqXyXHdmmT7rbM3v84QkUuawTM3sL9i1V9oWNJ2NVCEdB5
        CG6cJ7NwbvQ+TL6h36cMH0o3zrFsyXElSyGl8xysbA==
X-Google-Smtp-Source: APXvYqzC+SZLS5J+4fhjs10zmFF3ZVskrEEqUdAP/3LUu2LLwXYMIIoYM0ZhbtGFlpH7G417ya7cYZF2uvns6Cyv43rpDw==
X-Received: by 2002:a37:9a8b:: with SMTP id c133mr4814616qke.261.1562919522167;
 Fri, 12 Jul 2019 01:18:42 -0700 (PDT)
Date:   Fri, 12 Jul 2019 01:17:44 -0700
In-Reply-To: <20190712081744.87097-1-brendanhiggins@google.com>
Message-Id: <20190712081744.87097-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v9 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section,
and add Iurii as a maintainer.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Iurii Zaikin <yzaikin@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Luis Chamberlain <mcgrof@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 48d04d180a988..f8204c75114da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12721,12 +12721,14 @@ F:	Documentation/filesystems/proc.txt
 PROC SYSCTL
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Kees Cook <keescook@chromium.org>
+M:	Iurii Zaikin <yzaikin@google.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.22.0.410.gd8fdbe21b5-goog

