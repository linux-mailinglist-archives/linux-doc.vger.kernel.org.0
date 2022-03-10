Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2774D467E
	for <lists+linux-doc@lfdr.de>; Thu, 10 Mar 2022 13:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240587AbiCJMK0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Mar 2022 07:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239440AbiCJMK0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 07:10:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C12C1470C1
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 04:09:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1CDCFB82564
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 12:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13EBC340E8;
        Thu, 10 Mar 2022 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646914162;
        bh=LhRmS+vrpZoaKwfJVC57Idu15/prJ7woDjjR7jrcjPY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=stFUZYEVIhJ33uhot09+27wns6i0gdE+IViaKwq8Q6Vjx4Tvw70OFrz3espB1Y1O+
         YsESKWQT0+BgyELvqUslKITgmtf+s865Z53CKBCURtIjie4HZchmVSwWLz28wu2jfJ
         ln0xUqZcK7hSG6tffko2ALLRsqT//dnhiUrRPSGOujii4cF0U4z6bWdCJDxwCFPdnI
         YTSAOj+B0Dk79CZTM9qc3lpexXit+tSjGUs2g85lN9c70J7SoG/4IJhQ4kd3Y2RX2j
         hvoKT7Q43mlJCaOLPkc2VQDqXOs7/luSlVG3bq9090vESJCrd4IrQShI9YreFDFByu
         UV/fNGYOK3fAA==
Date:   Thu, 10 Mar 2022 14:09:12 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 3/5] mm/hugetlb_vmemmap: move comment block to
 Documentation/vm
Message-ID: <YinqaACBH7EvFQEn@kernel.org>
References: <20220307122457.10066-1-joao.m.martins@oracle.com>
 <20220307122457.10066-4-joao.m.martins@oracle.com>
 <YinT2fO2cDmoLYXG@kernel.org>
 <1debf72b-8354-604e-1574-bf956c869dd7@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1debf72b-8354-604e-1574-bf956c869dd7@oracle.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 10, 2022 at 11:32:21AM +0000, Joao Martins wrote:
> On 3/10/22 10:32, Mike Rapoport wrote:
> > Hi,
> > 
> > On Mon, Mar 07, 2022 at 12:24:55PM +0000, Joao Martins wrote:
> >> In preparation for device-dax for using hugetlbfs compound page tail
> >> deduplication technique, move the comment block explanation into a
> >> common place in Documentation/vm.
> >>
> >> Cc: Muchun Song <songmuchun@bytedance.com>
> >> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> >> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> >> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> >> ---
> >>  Documentation/vm/index.rst         |   1 +
> >>  Documentation/vm/vmemmap_dedup.rst | 173 +++++++++++++++++++++++++++++
> > 
> > Sorry for jumping late.
> > 
> > Please consider moving this into Documentation/vm/memory-model.rst along
> > with the documentation added in the next patch
> > 
> Hmmm, I don't think this is the right place to put it.
> 
> We don't change the memory model fundamentally (rather the *backing* pages of
> vmemmap VA in some specific cases) to justify putting the entire thing there.
> The new doc is also just as big as memory-model.rst doc. I feel the two separate
> docs stand on their own and the vmemmap dedup technique doc is better placed as
> its own.
> 
> Perhaps alternatively (in a followup patch) it could get a relevant mention
> (either in an new subsection or in paragraphs of the existing subsections)
> in memory-model.rst to point readers to vmemmap_dedup.rst...?

Sounds good to me.

-- 
Sincerely yours,
Mike.
