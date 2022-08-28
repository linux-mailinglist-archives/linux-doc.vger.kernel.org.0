Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1175A3E4A
	for <lists+linux-doc@lfdr.de>; Sun, 28 Aug 2022 17:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbiH1PRO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 28 Aug 2022 11:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiH1PRO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 11:17:14 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157432C671;
        Sun, 28 Aug 2022 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=8gXF7LrjbKoSgfLGKGIuajoO7CoREzc8fLsSZQdzPlg=; b=yTkSWc9nNMUzCqS7oNnJtE2kpg
        kkHaBow+DcWIU5zrUQKvGkBmLG9KpdmX6gnELWKmu0Mm66LRmiUliN4F57uLIXB5r2m+wjZ64dr8q
        vYDBikIFruImgS5CoC3PO7JfgqRKzfAzMCccSOPnHZ5QeJ/yu+WqVb2upE0Vw2ZcOzxUUigaxLLh1
        5rK5c+wDPQcNHMTMhQp+V7J7mjtsNyp2pLHjKFgY4y6rrBHojygH/ogjZtnUIPvs/IkUcEvRDSH5C
        ScD0krHUHcx8uPf5iQoZ7syycPzN7E2717uLJaI76KGyruCLhqkaquXBDXb9uVcFdfkrwDBFkN40H
        lOHJHebw==;
Received: from [2601:1c0:6280:3f0::a6b3]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oSK24-000CxF-FY; Sun, 28 Aug 2022 15:17:04 +0000
Message-ID: <e304cb66-4890-5770-fca3-156c3428bf3d@infradead.org>
Date:   Sun, 28 Aug 2022 08:17:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] Docs: ublk: add ublk document
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Ming Lei <ming.lei@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Richard W . M . Jones" <rjones@redhat.com>,
        ZiyangZhang <ZiyangZhang@linux.alibaba.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
References: <20220828045003.537131-1-ming.lei@redhat.com>
 <YwtiTr3E4b9c+Vcl@debian.me>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YwtiTr3E4b9c+Vcl@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/28/22 05:40, Bagas Sanjaya wrote:
>  Zero copy
>  ---------
>  
> -Wrt. zero copy support, it is one generic requirement for nbd, fuse or
> -similar drivers, one problem Xiaoguang mentioned is that pages mapped to
> -userspace can't be remapped any more in kernel with existed mm interfaces,
> -and it can be involved when submitting direct IO to /dev/ublkb*. Also
> -Xiaoguang reported that big request may benefit from zero copy a lot,
> -such as >= 256KB IO.
> +Wrt. zero copy support, which is a generic requirement for nbd, fuse or
> +similar drivers, a problem Xiaoguang mentioned is that pages mapped to
> +userspace can't be remapped any more in kernel with existing mm interfaces.
> +This can occurs when destining direct IO to ``/dev/ublkb*``. Also
> +he reported that big requests (>= 256 KB IO) may benefit a lot from zero copy.

I suggest eliminating "Wrt." also.

-- 
~Randy
