Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7141570B71
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jul 2019 23:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732710AbfGVVcX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jul 2019 17:32:23 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44284 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732707AbfGVVcW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 17:32:22 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so19682190plr.11
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2019 14:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mv7+8jJEeDbo3rALIQWEE79IiSHFEfgtW30JPgsaJYY=;
        b=RN51VtIvabaQniuWGM+pEPP9sY4v3p6xCZKepJA4+4kregQ3NwAojuNej56xQ688W8
         eLtSCHrEUHvqDuJG1YODwTmMS531wT5nr8f+7IPMA+tRi07n7hQ2+4nf6D7krbpHmVru
         +sIEA0pNjuayX8Cig3N0kz1/Ihvc6sa3pBBYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mv7+8jJEeDbo3rALIQWEE79IiSHFEfgtW30JPgsaJYY=;
        b=gyxaRKdK+n0OqG43YocGUkqW0UWSa4xA7y2vdqUaqqTlElmOgk7VlTdnRuPvhiRHVW
         G6+frAiN49n+ex7YWX/kjoZdZch+Z3OBDIp2/UzPcBivbCncm8A4lqarLwLB1cqFOsdm
         /ntnwzDzNixM3lzhvrMfxqmpR7PeZRwIfh4uow+yYssCrA4bIZmA4s3Q5Ogka7v0fKEy
         hS+my3fR2P2qnsQXLeoiQZs8N80I5ov2jAAHvT+SHPN56Yhu8Umo6eW39m3ueN27wcLi
         KHM7b94Wc/WL4pYX7zsvnFcc2xkgCcW2YQpzUtGCQf58C3qtDZCCfCwssZlPjpctW3um
         zpvA==
X-Gm-Message-State: APjAAAUceyvvSDFzVyB9DKsevHZKfjeBeKI2Ri4cmMmsqs4m+CvcGc4E
        tBOj7NyP78beRWpZlrvgAPo=
X-Google-Smtp-Source: APXvYqzeYQTGy2llesIRc8Xr/1lEdoWOVbeDS/M3QnnnhYqXSV2haWsR6uhZcgSUQ/kYpp4/+92/Rw==
X-Received: by 2002:a17:902:1566:: with SMTP id b35mr79260764plh.147.1563831141698;
        Mon, 22 Jul 2019 14:32:21 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id i14sm65202333pfk.0.2019.07.22.14.32.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 14:32:20 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Gregg <bgregg@netflix.com>, carmenjackson@google.com,
        Christian Hansen <chansen3@cisco.com>,
        Colin Ian King <colin.king@canonical.com>, dancol@google.com,
        David Howells <dhowells@redhat.com>, fmayer@google.com,
        joaodias@google.com, joelaf@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, minchan@google.com,
        minchan@kernel.org, namhyung@google.com, sspatil@google.com,
        surenb@google.com, Thomas Gleixner <tglx@linutronix.de>,
        timmurray@google.com, tkjos@google.com, vdavydov.dev@gmail.com,
        Vlastimil Babka <vbabka@suse.cz>, wvw@google.com
Subject: [PATCH v1 2/2] doc: Update documentation for page_idle virtual address indexing
Date:   Mon, 22 Jul 2019 17:32:05 -0400
Message-Id: <20190722213205.140845-2-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722213205.140845-1-joel@joelfernandes.org>
References: <20190722213205.140845-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch updates the documentation with the new page_idle tracking
feature which uses virtual address indexing.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 .../admin-guide/mm/idle_page_tracking.rst     | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/mm/idle_page_tracking.rst b/Documentation/admin-guide/mm/idle_page_tracking.rst
index df9394fb39c2..70d3bf6f1f8c 100644
--- a/Documentation/admin-guide/mm/idle_page_tracking.rst
+++ b/Documentation/admin-guide/mm/idle_page_tracking.rst
@@ -19,10 +19,14 @@ It is enabled by CONFIG_IDLE_PAGE_TRACKING=y.
 
 User API
 ========
+There are 2 ways to access the idle page tracking API. One uses physical
+address indexing, another uses a simpler virtual address indexing scheme.
 
-The idle page tracking API is located at ``/sys/kernel/mm/page_idle``.
-Currently, it consists of the only read-write file,
-``/sys/kernel/mm/page_idle/bitmap``.
+Physical address indexing
+-------------------------
+The idle page tracking API for physical address indexing using page frame
+numbers (PFN) is located at ``/sys/kernel/mm/page_idle``.  Currently, it
+consists of the only read-write file, ``/sys/kernel/mm/page_idle/bitmap``.
 
 The file implements a bitmap where each bit corresponds to a memory page. The
 bitmap is represented by an array of 8-byte integers, and the page at PFN #i is
@@ -74,6 +78,29 @@ See :ref:`Documentation/admin-guide/mm/pagemap.rst <pagemap>` for more
 information about ``/proc/pid/pagemap``, ``/proc/kpageflags``, and
 ``/proc/kpagecgroup``.
 
+Virtual address indexing
+------------------------
+The idle page tracking API for virtual address indexing using virtual page
+frame numbers (VFN) is located at ``/proc/<pid>/page_idle``. It is a bitmap
+that follows the same semantics as ``/sys/kernel/mm/page_idle/bitmap``
+except that it uses virtual instead of physical frame numbers.
+
+This idle page tracking API can be simpler to use than physical address
+indexing, since the ``pagemap`` for a process does not need to be looked up to
+mark or read a page's idle bit. It is also more accurate than physical address
+indexing since in physical address indexing, address space changes can occur
+between reading the ``pagemap`` and reading the ``bitmap``. In virtual address
+indexing, the process's ``mmap_sem`` is held for the duration of the access.
+
+To estimate the amount of pages that are not used by a workload one should:
+
+ 1. Mark all the workload's pages as idle by setting corresponding bits in
+    ``/proc/<pid>/page_idle``.
+
+ 2. Wait until the workload accesses its working set.
+
+ 3. Read ``/proc/<pid>/page_idle`` and count the number of bits set.
+
 .. _impl_details:
 
 Implementation Details
@@ -99,10 +126,10 @@ When a dirty page is written to swap or disk as a result of memory reclaim or
 exceeding the dirty memory limit, it is not marked referenced.
 
 The idle memory tracking feature adds a new page flag, the Idle flag. This flag
-is set manually, by writing to ``/sys/kernel/mm/page_idle/bitmap`` (see the
-:ref:`User API <user_api>`
-section), and cleared automatically whenever a page is referenced as defined
-above.
+is set manually, by writing to ``/sys/kernel/mm/page_idle/bitmap`` for physical
+addressing or by writing to ``/proc/<pid>/page_idle`` for virtual
+addressing (see the :ref:`User API <user_api>` section), and cleared
+automatically whenever a page is referenced as defined above.
 
 When a page is marked idle, the Accessed bit must be cleared in all PTEs it is
 mapped to, otherwise we will not be able to detect accesses to the page coming
-- 
2.22.0.657.g960e92d24f-goog

