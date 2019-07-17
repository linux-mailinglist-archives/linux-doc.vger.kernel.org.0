Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F86BBB7
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jul 2019 13:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730979AbfGQLoo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Jul 2019 07:44:44 -0400
Received: from smtp2-4.goneo.de ([85.220.129.36]:47826 "EHLO smtp2-4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbfGQLoo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Jul 2019 07:44:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id EEE0223F44D;
        Wed, 17 Jul 2019 13:44:41 +0200 (CEST)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.746
X-Spam-Level: 
X-Spam-Status: No, score=-2.746 tagged_above=-999 tests=[ALL_TRUSTED=-1,
        AWL=0.002, BAYES_00=-1.9, SARE_SUB_ENC_UTF8=0.152] autolearn=no
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id R78unk_qr9jZ; Wed, 17 Jul 2019 13:44:40 +0200 (CEST)
Received: from [10.5.17.100] (unknown [217.244.7.16])
        by smtp2.goneo.de (Postfix) with ESMTPSA id B3A4923FCD3;
        Wed, 17 Jul 2019 13:44:40 +0200 (CEST)
Subject: Re: [PATCH v3 06/20] docs: kernel_abi.py: fix UTF-8 support
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        gregkh@linuxfoundation.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
 <4967544f097ebce823133b1dad0ff374ba1a4fbb.1563360659.git.mchehab+samsung@kernel.org>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <fd4ae75a-3cb3-3f26-8891-e503451355b9@darmarit.de>
Date:   Wed, 17 Jul 2019 13:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4967544f097ebce823133b1dad0ff374ba1a4fbb.1563360659.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

just nitpicking ..

Am 17.07.19 um 13:05 schrieb Mauro Carvalho Chehab:
> The parser breaks with UTF-8 characters with Sphinx 1.4.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/sphinx/kernel_abi.py | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index 32ce90775d96..0f3e51e67e8d 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -1,4 +1,5 @@
> -# -*- coding: utf-8; mode: python -*-
> +# coding=utf-8

Can we use the more common::

   # -*- coding: utf-8 -*-

notation?  See [1] """using formats recognized by popular editors"""

If I'am not wrong,  I remember we had this 'magic comment' discussion in the past.

Thanks!

-- Markus --

[1] https://www.python.org/dev/peps/pep-0263/#defining-the-encoding
