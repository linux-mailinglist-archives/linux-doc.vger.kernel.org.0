Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1644212B5E
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2020 19:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgGBRho (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Jul 2020 13:37:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgGBRhn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 2 Jul 2020 13:37:43 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A499E2084C;
        Thu,  2 Jul 2020 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593711463;
        bh=1vepKaYYqNVStgMcSEqne0b61xz9fogC9Q/VQh/kauA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QFTCPvMxhSD28x41VRfpPfIpNfxoXMLzBp+fBSfvnDltdZj6afbu6u3aDqTe3dTYd
         jPTflEFePo3961OTxrQXwuSBxKsrcW/EtDWTKRUbMr8osgdOg3vA/CLMkgm3xSRfGc
         5ePFSnE2iF1AM6OT9U+jo1B5p1lN//uIPvogP9O0=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 8D309352334B; Thu,  2 Jul 2020 10:37:43 -0700 (PDT)
Date:   Thu, 2 Jul 2020 10:37:43 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     Josh Triplett <josh@joshtriplett.org>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: RCU: fix typo in function name
Message-ID: <20200702173743.GU9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200702162810.31227-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702162810.31227-1-tklauser@distanz.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 02, 2020 at 06:28:10PM +0200, Tobias Klauser wrote:
> s/sychronize_rcu/synchronize_rcu/
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Good eyes, applied, thank you!

							Thanx, Paul

> ---
>  Documentation/RCU/whatisRCU.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> index c7f147b8034f..fb3ff76c3e73 100644
> --- a/Documentation/RCU/whatisRCU.rst
> +++ b/Documentation/RCU/whatisRCU.rst
> @@ -360,7 +360,7 @@ order to amortize their overhead over many uses of the corresponding APIs.
>  
>  There are at least three flavors of RCU usage in the Linux kernel. The diagram
>  above shows the most common one. On the updater side, the rcu_assign_pointer(),
> -sychronize_rcu() and call_rcu() primitives used are the same for all three
> +synchronize_rcu() and call_rcu() primitives used are the same for all three
>  flavors. However for protection (on the reader side), the primitives used vary
>  depending on the flavor:
>  
> -- 
> 2.27.0
> 
