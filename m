Return-Path: <linux-doc+bounces-41314-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A6A693FA
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 16:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656D31B6749B
	for <lists+linux-doc@lfdr.de>; Wed, 19 Mar 2025 15:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF1B1DA11B;
	Wed, 19 Mar 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAEcRl/Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB51D88D7;
	Wed, 19 Mar 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742398894; cv=none; b=D9KSt6J+uE5lxwhdNxs+TKACZItaCrMLXmkanvH9sDq073gjvJDnFHElCw2c31NA3dERWSqGTUCTiKLbzPWZv5Pw6cigaKijlO03pQg/00+Tl9F2VaUv7bFqxaOQavYPkY8bT7hFM9nl5E9F247OovwDBR7CYJAnzhzyIHPNueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742398894; c=relaxed/simple;
	bh=anoQMcemxEkwKzNr2lrI98iNp2Mn7t9cx9/h834biWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/JijMwDBVL7uig+d1tz4IY+R07PrITbkdW9+dNKPm+0X7Vd1OegQvy6rs52edrro8ht+7DlL4EIFdoF3/4P485fUc0b9CZ7jImaj4oU85MrUEvSzuR3SQfkugOGKoc6S8BSf+yrlN3b1TRWQx5qkpBURLhxcP26FBEr6/5ELn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAEcRl/Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2F9C4CEE4;
	Wed, 19 Mar 2025 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742398894;
	bh=anoQMcemxEkwKzNr2lrI98iNp2Mn7t9cx9/h834biWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAEcRl/YrF2qm4wALFGUnN2IuFtUPjiiPNBDXqZfiB+iab8T0bDICun4WrD2Gf6uq
	 6znnCZtGEePGoGQKdsiG5oZNs1lQpfG2KUfMMUiA+wizyKKp7wLQlxysr8yY/0izl8
	 MsotMMpjbwFHHRUfJAgPlkYeA9uq6JGz9uBeoMEPSY9+IjdOxLD2uHjGtABeClMcyG
	 03kgcjeHn4gFWmUNX0HRTpr8rp5nQtIhmE9vqHrslkI6EOdmRRiHISkJgJb9jb+AQ0
	 9c+JYQIvs5COjo+8B/c4GHJVwL7+sPpqctECogUY3DNlRndBRn4rQe0e4bDl7H7Tf+
	 eCzsFmgbNCERQ==
Date: Wed, 19 Mar 2025 15:41:26 +0000
From: Simon Horman <horms@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	Manu Bretelle <chantr4@gmail.com>, kernel-team@meta.com
Subject: Re: [PATCH net-next 4/6] netconsole: append release to sysdata
Message-ID: <20250319154126.GI768132@kernel.org>
References: <20250314-netcons_release-v1-0-07979c4b86af@debian.org>
 <20250314-netcons_release-v1-4-07979c4b86af@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-netcons_release-v1-4-07979c4b86af@debian.org>

On Fri, Mar 14, 2025 at 10:58:48AM -0700, Breno Leitao wrote:
> Append the init_utsname()->release to sysdata buffer before sending the
> message in case the feature is set.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Simon Horman <horms@kernel.org>


