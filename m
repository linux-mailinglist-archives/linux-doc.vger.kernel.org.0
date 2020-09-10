Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D06264A81
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 19:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgIJQ6v (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 12:58:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:42276 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727001AbgIJQ47 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Sep 2020 12:56:59 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8FD2B4FA;
        Thu, 10 Sep 2020 16:56:58 +0000 (UTC)
Date:   Thu, 10 Sep 2020 10:56:57 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ralph Campbell <rcampbell@nvidia.com>
Cc:     <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm/doc: add usage description for migrate_vma_*()
Message-ID: <20200910105657.6007c5ca@lwn.net>
In-Reply-To: <20200909212956.20104-1-rcampbell@nvidia.com>
References: <20200909212956.20104-1-rcampbell@nvidia.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 Sep 2020 14:29:56 -0700
Ralph Campbell <rcampbell@nvidia.com> wrote:

> The migrate_vma_setup(), migrate_vma_pages(), and migrate_vma_finalize()
> API usage by device drivers is not well documented.
> Add a description for how device drivers are expected to use it.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
> 
> There shouldn't be any merge conflict with my previous patch which
> touched hmm.rst but since Jonathan Corbet took my last patch, perhaps he
> would like to take this one through his tree too.

I'm happy to take it, but it certainly needs an ack from somebody who
understands HMM better than I do.

Thanks,

jon
