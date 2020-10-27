Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B38429C55C
	for <lists+linux-doc@lfdr.de>; Tue, 27 Oct 2020 19:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1824773AbgJ0SFp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Oct 2020 14:05:45 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:39931 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757245AbgJ0ORC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Oct 2020 10:17:02 -0400
Received: by mail-qt1-f201.google.com with SMTP id f10so823040qtv.6
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2020 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=wCJj2niDD0UYdNAX1uGcFN6Y0ai150vISrExHKtf6C4=;
        b=SOg6ccVglymms5JOu8kb9TjhZPPQVRckjEybAsgfjZHba22NrOs64rlZ3W8FFEQz3h
         Fggr/3AHaCp4I7hjpha7d73zIxX9ecTUXrKxsayXOPBPUOihD6EHuYXbSBWXZG42D4CF
         m4c0OJDG36Jo2U07bMeNvO8ft+c1T00fSobHFVrm9cbxxujspImo3rrRJSkC4SkhMi4M
         UJ/brVr6l9opWX6HsPMi0wVXeJMUGMHCpd9eo3qJWZ0vtxgj1zHtAyDnU/6r7j6tN+rF
         pSlNlMhPp5O0w0uATTXbeeAcUkUqZWXvwN6peu2XuP6y9PQqKJMiIv8S8b3j5CCzT4sX
         5xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wCJj2niDD0UYdNAX1uGcFN6Y0ai150vISrExHKtf6C4=;
        b=XkWjW9MfJuwRuWCknF2PSZ5j+EX940mDAYyw3dp6ODE6BcBwM1a2fUpYH8damt1qsL
         KwgGp/w7UwCz+VUNF1Wq2MrMk4KNrtHHdyiAkYKNvaRTF4fVUVFrlLoAIopcSWkx/65s
         PD+iiGlTR+IU/x5CIDu7G5KXUNCfm38e94kTIOw6KhMlou+WBVcGfbGbcakYWw0DdQWE
         Y+roF4nMQuzxOzzcOA8SmuSEBWdi42v/cKivgfh3M/aEAh64b+tVo2EsbpCjYX1+hWYD
         UBQ8EKGWvTS+7V6rBt/yPmEBvxrFUIomaphvfef/7hYLPYwUn1pJKIKyt6FVP/d/iIBD
         OUbA==
X-Gm-Message-State: AOAM530U0CEYHK/RuFzxfypYulqIsQTsHY6VLdzYQ1iM/OQPaCptVBMY
        lVu7EP540MEzEei+6ZlS/SZvxPXSYg==
X-Google-Smtp-Source: ABdhPJy1oIs8UirQXTbJFz0vzFCEkdYbncmUw25FCexvHwdI/J7bZjUwk617PTSTiaklWVpfwpeGJ5Nb7w==
Sender: "elver via sendgmr" <elver@elver.muc.corp.google.com>
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 (user=elver job=sendgmr) by 2002:a0c:f8cd:: with SMTP id h13mr2597150qvo.10.1603808218321;
 Tue, 27 Oct 2020 07:16:58 -0700 (PDT)
Date:   Tue, 27 Oct 2020 15:16:06 +0100
In-Reply-To: <20201027141606.426816-1-elver@google.com>
Message-Id: <20201027141606.426816-10-elver@google.com>
Mime-Version: 1.0
References: <20201027141606.426816-1-elver@google.com>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
Subject: [PATCH v5 9/9] MAINTAINERS: Add entry for KFENCE
From:   Marco Elver <elver@google.com>
To:     elver@google.com, akpm@linux-foundation.org, glider@google.com
Cc:     hpa@zytor.com, paulmck@kernel.org, andreyknvl@google.com,
        aryabinin@virtuozzo.com, luto@kernel.org, bp@alien8.de,
        catalin.marinas@arm.com, cl@linux.com, dave.hansen@linux.intel.com,
        rientjes@google.com, dvyukov@google.com, edumazet@google.com,
        gregkh@linuxfoundation.org, hdanton@sina.com, mingo@redhat.com,
        jannh@google.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
        iamjoonsoo.kim@lge.com, joern@purestorage.com,
        keescook@chromium.org, mark.rutland@arm.com, penberg@kernel.org,
        peterz@infradead.org, sjpark@amazon.com, tglx@linutronix.de,
        vbabka@suse.cz, will@kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for KFENCE maintainers.

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: SeongJae Park <sjpark@amazon.de>
Co-developed-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* Split out from first patch.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..2a257c865795 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9753,6 +9753,17 @@ F:	include/linux/keyctl.h
 F:	include/uapi/linux/keyctl.h
 F:	security/keys/
 
+KFENCE
+M:	Alexander Potapenko <glider@google.com>
+M:	Marco Elver <elver@google.com>
+R:	Dmitry Vyukov <dvyukov@google.com>
+L:	kasan-dev@googlegroups.com
+S:	Maintained
+F:	Documentation/dev-tools/kfence.rst
+F:	include/linux/kfence.h
+F:	lib/Kconfig.kfence
+F:	mm/kfence/
+
 KFIFO
 M:	Stefani Seibold <stefani@seibold.net>
 S:	Maintained
-- 
2.29.0.rc2.309.g374f81d7ae-goog

