Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9187434143B
	for <lists+linux-doc@lfdr.de>; Fri, 19 Mar 2021 05:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhCSEao (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Mar 2021 00:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229447AbhCSEaf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Mar 2021 00:30:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 635CF64F10;
        Fri, 19 Mar 2021 04:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616128235;
        bh=HXy3pYjZuf3EMGhjnfopCxdy+TwfPo/p46dhDsiK7R0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=FGRXgTcfjF7EWQdqCUqTjKIabrhF5F+MnrzqUSDJJmyIY7jU+O3+GG2dzIDi6fi9w
         FqbqNgs8b74LNGVWQUWyzCEj4OYB6Fn5DWPKnpVJoRQIbLfFcISiCyyRxqZ57TsQ+j
         IwOqdo7VsEME7KPthvZ7d/32p4aSJ/Riadf8v0SZKLSkuxrKCWWvUSKxwulvOL44nU
         f3N+HwYDdB2XQuac6aF60zuERZhEuexGbkYYJiu/DOarM60GIwGc42xEOelPVnyzsN
         D1G7RPGxt8Mx4JcuVQSUuLlg+TBDeySS/4kEdRvn1cKDkMi4zMz7nhOIFFAJO+fR30
         ZuxKwlKPQeUyw==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 1E7513522AC5; Thu, 18 Mar 2021 21:30:34 -0700 (PDT)
Date:   Thu, 18 Mar 2021 21:30:34 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     corbet@lwn.net, rcu@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Use my proper surname
Message-ID: <20210319043034.GI2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210319001916.136666-1-sthemmin@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319001916.136666-1-sthemmin@microsoft.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 18, 2021 at 05:19:16PM -0700, Stephen Hemminger wrote:
> From: Stephen Hemminger <stephen@networkplumber.org>
> 
> Fix my name in the RCU background file. I don't use Steve.
> 
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>

You would like me to replace this commit in -rcu with the patch
in this email, correct?

e589c7c72315 ("docs: Correctly spell Stephen Hemminger's name")

This is slated for the upcoming merge window, for whatever it
is worth.

						Thanx, Paul

> ---
>  Documentation/RCU/RTFP.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
> index 3b0876c77355..588d97366a46 100644
> --- a/Documentation/RCU/RTFP.txt
> +++ b/Documentation/RCU/RTFP.txt
> @@ -847,7 +847,7 @@ Symposium on Distributed Computing}
>  	'It's entirely possible that the current user could be replaced
>  	by RCU and/or seqlocks, and we could get rid of brlocks entirely.'
>  	.
> -	Steve Hemminger responds by replacing them with RCU.
> +	Stephen Hemminger responds by replacing them with RCU.
>  }
>  }
>  
> -- 
> 2.30.2
> 
