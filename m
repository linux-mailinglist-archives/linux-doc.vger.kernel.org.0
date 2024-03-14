Return-Path: <linux-doc+bounces-12109-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A535087B622
	for <lists+linux-doc@lfdr.de>; Thu, 14 Mar 2024 02:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C26C81C216E2
	for <lists+linux-doc@lfdr.de>; Thu, 14 Mar 2024 01:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F111D1FB4;
	Thu, 14 Mar 2024 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMBAH9b5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE92B1C01;
	Thu, 14 Mar 2024 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710380419; cv=none; b=AiCqvoLZE3I0BSajQVaAXUxx3GReEcHgqtoeTXltt1kQKLaO5CiKbScyYbeYQPMgEa31ecV69hk423mXal4W49eZ1r3JEbD2JUPorUl0mqDu/qVph9tjwsD77bfP5mZh6vjbicY+ab8AZlZmLUV7KnW94dccM+jNOh/5/OalXhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710380419; c=relaxed/simple;
	bh=kvXW8liJ0/hpqok4m5hQ/AwKwmRwkWmG+mHGEV5qkwo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXxIzqGSYz3sfIOFX2vdUInGxa5I0DP4kaxc8Wzm8ipXixLB6U3bXOaNqxYCL7POS8Dq+38N5RrIShn4ziE0bhBusc8QWoJS8asfVuIY5aTdVGGjgZEDo69BPfp8CiMrM0QBcK8lrIccITzjBKr8WqtgYYZkYtPYKGSHst4wJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMBAH9b5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A17DC433F1;
	Thu, 14 Mar 2024 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710380419;
	bh=kvXW8liJ0/hpqok4m5hQ/AwKwmRwkWmG+mHGEV5qkwo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SMBAH9b5wtLQ8UT/duFA0ybn2luz4k/pIhOxu+Hu7J1LIZVt9tb3/DH0/5LmG8XNL
	 ysakWHAa8csntrrYqYGqHqJQTklfzFHnvV5P/K0G0TYqrfM1XgvUwf0tHyTW5+GXr2
	 BjbnWnYlHfpHPxdf/WWjlbgUpUR3PKZH8vlGYeAELTQ+39oh/y2P/qId8WbMzu6eP7
	 1YNI/e4zrYhf+6OYrM4Wv07wBDa9YLaPc53od3feVCc0J8+aTJW6FMVvQlIAmDxBK0
	 M4JTXK912gHBrXztDRYFO40KGeZOI2jrWjXhYE8uYLOfuqEZIy/BSS8ir7PopJ5MAh
	 Jfw4St0Ps8M+w==
Date: Wed, 13 Mar 2024 18:40:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: ahmed.zaki@intel.com, aleksander.lobakin@intel.com,
 alexandre.torgue@foss.st.com, andrew@lunn.ch, corbet@lwn.net,
 davem@davemloft.net, dtatulea@nvidia.com, edumazet@google.com,
 gal@nvidia.com, hkallweit1@gmail.com, jacob.e.keller@intel.com,
 jiri@resnulli.us, joabreu@synopsys.com, justinstitt@google.com,
 kory.maincent@bootlin.com, leon@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@gmail.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org, pabeni@redhat.com,
 paul.greenwalt@intel.com, przemyslaw.kitszel@intel.com,
 rdunlap@infradead.org, richardcochran@gmail.com, saeed@kernel.org,
 tariqt@nvidia.com, vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com,
 wojciech.drewek@intel.com
Subject: Re: [PATCH RFC v2 1/6] ethtool: add interface to read Tx hardware
 timestamping statistics
Message-ID: <20240313184017.794a2044@kernel.org>
In-Reply-To: <87h6h9bpm1.fsf@nvidia.com>
References: <20240223192658.45893-1-rrameshbabu@nvidia.com>
	<20240309084440.299358-1-rrameshbabu@nvidia.com>
	<20240309084440.299358-2-rrameshbabu@nvidia.com>
	<20240312165346.14ec1941@kernel.org>
	<87le6lbqsa.fsf@nvidia.com>
	<20240313174107.68ca4ff1@kernel.org>
	<87h6h9bpm1.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 Mar 2024 17:50:39 -0700 Rahul Rameshbabu wrote:
> > Should we give some guidance to drivers which "ignore" time stamping
> > requests if they used up all the "slots"? Even if just temporary until
> > they are fixed? Maybe we can add after all the fields something like:
> >
> >   For drivers which ignore further timestamping requests when there are
> >   too many in flight, the ignored requests are currently not counted by
> >   any of the statistics.  
> 
> I was actually thinking it would be better to merge them into the error
> counter temporarily. Reason being is that in the case Intel notices that
> their slots are full, they just drop traffic from my understanding
> today. If the error counters increment in that situation, it helps with
> the debug to a degree. EBUSY is an error in general.

That works, too, let's recommend it (FWIW no preference whether
in the entry for @err or somewhere separately in the kdoc).

