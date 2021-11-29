Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7178C461C26
	for <lists+linux-doc@lfdr.de>; Mon, 29 Nov 2021 17:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbhK2QyT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Nov 2021 11:54:19 -0500
Received: from verein.lst.de ([213.95.11.211]:54562 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347353AbhK2QwS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Nov 2021 11:52:18 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0251F68B05; Mon, 29 Nov 2021 17:48:53 +0100 (CET)
Date:   Mon, 29 Nov 2021 17:48:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
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
Subject: Re: [PATCH v6 09/10] device-dax: set mapping prior to
 vmf_insert_pfn{,_pmd,pud}()
Message-ID: <20211129164852.GB27705@lst.de>
References: <20211124191005.20783-1-joao.m.martins@oracle.com> <20211124191005.20783-10-joao.m.martins@oracle.com> <0439eb48-1688-a4f4-5feb-8eb2680d652f@oracle.com> <96b53b3c-5c18-5f93-c595-a7d509d58f92@oracle.com> <20211129073235.GA23843@lst.de> <b8056071-d0fe-b8ef-5fe3-85ab639f4bf7@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8056071-d0fe-b8ef-5fe3-85ab639f4bf7@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 29, 2021 at 03:49:46PM +0000, Joao Martins wrote:
> Hmmm -- if by individual helpers moving to __dev_dax_{pte,pmd,pud}_fault()
> it would be slightly less straighforward. Unless you might mean to move
> to check_vma() (around the dax_alive() check) and that might actually
> remove the opencoding of dax_read_lock in dax_mmap() even.
> 
> I would rather prefer that this cleanup around dax_read_{un,}lock is
> a separate patch separate to this series, unless you feel strongly that
> it needs to be part of this set.

Feel free to keep it as-is.
