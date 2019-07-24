Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F1773EF6
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2019 22:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388989AbfGXU2w (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Jul 2019 16:28:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33239 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389015AbfGXTeA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jul 2019 15:34:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id f20so12480121pgj.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2019 12:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c620Z7QmNN4xuzBoT0I523KlXKmQArPqXiiSBk5DJAo=;
        b=aJRIeg6pq323ryehRW15NWh/H46jxm2+UlXPt/GAp+gGlXsdiD5tuwNAzwSOlQjvte
         kAf7yvLfhsa31LbfvzoQxal4db/+ND5t3sCE3KQ0cK1D2FNrEMSsUF10lD+va5+XCjZF
         82tS1vs8G8RyiJ9FtkZUoim+/k0zp6iCqhTGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c620Z7QmNN4xuzBoT0I523KlXKmQArPqXiiSBk5DJAo=;
        b=h32XFfdIcZUcBAxlmJsXjJKeIdK2rUHs3YWxpNIeaMue27ghKabnY0lDzRLNNcJ5lN
         ZmnxP+WSys13lZDbh5aox0bBrx3m8yrmib05XB/3U7p7V6/iBDEf7wl8cJQTtC1LPd+5
         wZsRn7mtFKmti7/3/X4fMayUnLuvMBRGxWqAjeebqwmfFiOMNqk37xPjK+/3H8Yjk4OO
         6W5CUxjMLp5C2+krXBfMZRrXdZA5t/r2dF0t8sHsNTQWWFUl3GnpqlKT7XeotxALMkAE
         0CtTH+el4EV/OFATQnV5UdCbzAvzpzC01NZ0vYgBXKp9SCWP1rRfgVRDP8utKOIuH1B/
         DOiw==
X-Gm-Message-State: APjAAAUOji8h/d5xaTRjD6vu6uAp7VTE5wJVx0+z2X/CS3XcK8QWcWN6
        sLpEkR/KKj1n/Pg8HrpfwZ4=
X-Google-Smtp-Source: APXvYqxRZo6EdKy/Ij4HPNmhe7JYCvmAq8gwdkPC9eWWevt48AruaweG4iMi6+eWocFY2nBwaDK8/g==
X-Received: by 2002:a17:90a:2190:: with SMTP id q16mr86312060pjc.23.1563996839453;
        Wed, 24 Jul 2019 12:33:59 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id i124sm87050514pfe.61.2019.07.24.12.33.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 12:33:58 -0700 (PDT)
Date:   Wed, 24 Jul 2019 15:33:57 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, vdavydov.dev@gmail.com,
        Brendan Gregg <bgregg@netflix.com>, kernel-team@android.com,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>, carmenjackson@google.com,
        Christian Hansen <chansen3@cisco.com>,
        Colin Ian King <colin.king@canonical.com>, dancol@google.com,
        David Howells <dhowells@redhat.com>, fmayer@google.com,
        joaodias@google.com, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, minchan@google.com,
        minchan@kernel.org, namhyung@google.com, sspatil@google.com,
        surenb@google.com, Thomas Gleixner <tglx@linutronix.de>,
        timmurray@google.com, tkjos@google.com,
        Vlastimil Babka <vbabka@suse.cz>, wvw@google.com
Subject: Re: [PATCH v1 1/2] mm/page_idle: Add support for per-pid page_idle
 using virtual indexing
Message-ID: <20190724193357.GB21829@google.com>
References: <20190722213205.140845-1-joel@joelfernandes.org>
 <20190722150639.27641c63b003dd04e187fd96@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722150639.27641c63b003dd04e187fd96@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 22, 2019 at 03:06:39PM -0700, Andrew Morton wrote:
[snip] 
> > +	*end = *start + count * BITS_PER_BYTE;
> > +	if (*end > max_frame)
> > +		*end = max_frame;
> > +	return 0;
> > +}
> > +
> >
> > ...
> >
> > +static void add_page_idle_list(struct page *page,
> > +			       unsigned long addr, struct mm_walk *walk)
> > +{
> > +	struct page *page_get;
> > +	struct page_node *pn;
> > +	int bit;
> > +	unsigned long frames;
> > +	struct page_idle_proc_priv *priv = walk->private;
> > +	u64 *chunk = (u64 *)priv->buffer;
> > +
> > +	if (priv->write) {
> > +		/* Find whether this page was asked to be marked */
> > +		frames = (addr - priv->start_addr) >> PAGE_SHIFT;
> > +		bit = frames % BITMAP_CHUNK_BITS;
> > +		chunk = &chunk[frames / BITMAP_CHUNK_BITS];
> > +		if (((*chunk >> bit) & 1) == 0)
> > +			return;
> > +	}
> > +
> > +	page_get = page_idle_get_page(page);
> > +	if (!page_get)
> > +		return;
> > +
> > +	pn = kmalloc(sizeof(*pn), GFP_ATOMIC);
> 
> I'm not liking this GFP_ATOMIC.  If I'm reading the code correctly,
> userspace can ask for an arbitrarily large number of GFP_ATOMIC
> allocations by doing a large read.  This can potentially exhaust page
> reserves which things like networking Rx interrupts need and can make
> this whole feature less reliable.

For the revision, I will pre-allocate the page nodes in advance so it does
not need to do this. Diff on top of this patch is below. Let me know any
comments, thanks.

Btw, I also dropped the idle_page_list_lock by putting the idle_page_list
list_head on the stack instead of heap.
---8<-----------------------

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: [PATCH] mm/page_idle: Avoid need for GFP_ATOMIC

GFP_ATOMIC can harm allocations does by other allocations that are in
need of reserves and the like. Pre-allocate the nodes list so that
spinlocked region can just use it.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 mm/page_idle.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/mm/page_idle.c b/mm/page_idle.c
index 874a60c41fef..b9c790721f16 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -266,6 +266,10 @@ struct page_idle_proc_priv {
 	unsigned long start_addr;
 	char *buffer;
 	int write;
+
+	/* Pre-allocate and provide nodes to add_page_idle_list() */
+	struct page_node *page_nodes;
+	int cur_page_node;
 };
 
 static void add_page_idle_list(struct page *page,
@@ -291,10 +295,7 @@ static void add_page_idle_list(struct page *page,
 	if (!page_get)
 		return;
 
-	pn = kmalloc(sizeof(*pn), GFP_ATOMIC);
-	if (!pn)
-		return;
-
+	pn = &(priv->page_nodes[priv->cur_page_node++]);
 	pn->page = page_get;
 	pn->addr = addr;
 	list_add(&pn->list, &idle_page_list);
@@ -379,6 +380,15 @@ ssize_t page_idle_proc_generic(struct file *file, char __user *ubuff,
 	priv.buffer = buffer;
 	priv.start_addr = start_addr;
 	priv.write = write;
+
+	priv.cur_page_node = 0;
+	priv.page_nodes = kzalloc(sizeof(struct page_node) * (end_frame - start_frame),
+				  GFP_KERNEL);
+	if (!priv.page_nodes) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
 	walk.private = &priv;
 	walk.mm = mm;
 
@@ -425,6 +435,7 @@ ssize_t page_idle_proc_generic(struct file *file, char __user *ubuff,
 		ret = copy_to_user(ubuff, buffer, count);
 
 	up_read(&mm->mmap_sem);
+	kfree(priv.page_nodes);
 out:
 	kfree(buffer);
 out_mmput:
-- 
2.22.0.657.g960e92d24f-goog

