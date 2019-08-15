Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B8E8EB0F
	for <lists+linux-doc@lfdr.de>; Thu, 15 Aug 2019 14:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfHOMHH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Aug 2019 08:07:07 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:57230 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731630AbfHOMHG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Aug 2019 08:07:06 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hyEWu-0003LU-Gz; Thu, 15 Aug 2019 22:06:56 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hyEWt-0007ho-KQ; Thu, 15 Aug 2019 22:06:55 +1000
Date:   Thu, 15 Aug 2019 22:06:55 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: crypto: crypto_engine: Fix Sphinx warning
Message-ID: <20190815120655.GE29355@gondor.apana.org.au>
References: <20190808163011.13468-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808163011.13468-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 08, 2019 at 06:30:11PM +0200, Jonathan Neuschäfer wrote:
> This fixes the following Sphinx warning:
> 
> Documentation/crypto/crypto_engine.rst:2:
>   WARNING: Explicit markup ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/crypto/crypto_engine.rst | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
