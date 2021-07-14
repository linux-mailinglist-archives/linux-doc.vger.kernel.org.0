Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2A63C935C
	for <lists+linux-doc@lfdr.de>; Wed, 14 Jul 2021 23:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbhGNVvY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Jul 2021 17:51:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229498AbhGNVvX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:51:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DCCE6128B;
        Wed, 14 Jul 2021 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1626299311;
        bh=sm6E/cbteIMU7Qx63UQrMGOgDgJUOWcBWsYvE7fWGnE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LcfdOszA4jr3910Y2aYZb+/wqExxuo8m4IfDbZeRsgsuuSO0V5U2tJEzhmuVuSH3n
         4YY11zKSmpdTlfu6K4XTlHnO4/gU5hFcVqnAFv8sQGeEisNUeJKGJBv1H+q+S4gc7q
         hnVnGR3Dt+OlShBPewICHWBbLoUKSqQ0IPlhkstY=
Date:   Wed, 14 Jul 2021 14:48:30 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/14] mm, sparse-vmemmap: Introduce compound
 pagemaps
Message-Id: <20210714144830.29f9584878b04903079ef7eb@linux-foundation.org>
In-Reply-To: <20210714193542.21857-1-joao.m.martins@oracle.com>
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 14 Jul 2021 20:35:28 +0100 Joao Martins <joao.m.martins@oracle.com> wrote:

> This series, attempts at minimizing 'struct page' overhead by
> pursuing a similar approach as Muchun Song series "Free some vmemmap
> pages of hugetlb page"[0] but applied to devmap/ZONE_DEVICE which is now
> in mmotm. 
> 
> [0] https://lore.kernel.org/linux-mm/20210308102807.59745-1-songmuchun@bytedance.com/

[0] is now in mainline.

This patch series looks like it'll clash significantly with the folio
work and it is pretty thinly reviewed, so I think I'll take a pass for
now.  Matthew, thoughts?
