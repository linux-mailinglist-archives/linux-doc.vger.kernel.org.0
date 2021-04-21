Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8FB366EF1
	for <lists+linux-doc@lfdr.de>; Wed, 21 Apr 2021 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbhDUPUK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 21 Apr 2021 11:20:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:50952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234573AbhDUPUJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Apr 2021 11:20:09 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CE7961427;
        Wed, 21 Apr 2021 15:19:34 +0000 (UTC)
Date:   Wed, 21 Apr 2021 11:19:32 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Yury Norov <yury.norov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 1/2] bitmap_parse: support 'all' semantics
Message-ID: <20210421111932.36665920@gandalf.local.home>
In-Reply-To: <20210421031326.72816-2-yury.norov@gmail.com>
References: <20210421031326.72816-1-yury.norov@gmail.com>
        <20210421031326.72816-2-yury.norov@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 20 Apr 2021 20:13:25 -0700
Yury Norov <yury.norov@gmail.com> wrote:

> @@ -76,6 +76,11 @@ to change, such as less cores in the CPU list, then N and any ranges using N
>  will also change.  Use the same on a small 4 core system, and "16-N" becomes
>  "16-3" and now the same boot input will be flagged as invalid (start > end).
>  
> +The special case-tolerant group name "all" has a meaning of selecting all CPUs,
> +such that "isolcpus=all" is the equivalent of "isolcpus=0-N".

I'm OK with the concept of this patch set, but really? That is a horrible
example. One should NEVER set isolcpus to all!

-- Steve


> +
> +The semantics of "N" and "all" is supported on a level of bitmaps and holds for
> +all users of bitmap_parse().
>  
