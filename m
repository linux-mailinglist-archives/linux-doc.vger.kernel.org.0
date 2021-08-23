Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82D03F4FA1
	for <lists+linux-doc@lfdr.de>; Mon, 23 Aug 2021 19:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhHWRib (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 Aug 2021 13:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbhHWRib (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 13:38:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F146C061575
        for <linux-doc@vger.kernel.org>; Mon, 23 Aug 2021 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=cER/Phzhfzce7ulheriIouEoxppb2Zz/nGERbEJHKy4=; b=Tcm3J0fNxbTpdJ57QAJ16Dd+1i
        S2XWe8rW9sEwrV1qDWKjFTUBAzxdVRpRxb7DJxPIkX8jOf51HaLRkxGZA5r4zYmXxbq/WCQ6Uh2cl
        L91VbtnAonSm1jNrqj+ItXbyhYwZpS7fK9BJ0kNDvwEmOssxsSJx9mQKgThQmlExXkS2uS/qlE9rg
        GHo3DUhkmODnHou20jmYEWs8UQtJG7p515vG9/QYCgQGY8F8eLiCmxp0epe+7E4dVtdvGrmal7g+e
        06t/z7e093MoYqQ+gJjGn9xhaL+yjS26S1HYX9L9WggXnUXsqvxGGSAbZrtvDekMn9Gvr46JaOQHw
        PvZC/GMw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mIDsl-00A21z-KG; Mon, 23 Aug 2021 17:37:16 +0000
Date:   Mon, 23 Aug 2021 18:37:11 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Alexander Aring <aahringo@redhat.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: locking: fix references
Message-ID: <YSPcxzujfgmVhsLF@casper.infradead.org>
References: <20210823171546.1686907-1-aahringo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823171546.1686907-1-aahringo@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 23, 2021 at 01:15:46PM -0400, Alexander Aring wrote:
> -boosting logic [see rt-mutex-desgin.txt] For the purposes of
> +boosting logic [see rt-mutex-desgin.rst] For the purposes of

desgin?
