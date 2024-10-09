Return-Path: <linux-doc+bounces-26912-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E3996A41
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 14:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EAA1B20997
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 12:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1C31946AA;
	Wed,  9 Oct 2024 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMMXjl6G"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C356E191F90;
	Wed,  9 Oct 2024 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728477689; cv=none; b=abD3Z+ZCAbfTzcVVuohi9FubnAVZYjweDdBUG5De9TQ04ih6h7kOIkB5gXmvyJx7fbMpWCsuIFsQuuaCZ1whu9bfNESvQWyufZl5hBcER9gB14t3ahsEgPZUUtNYfQJcOLUHsPv7sJZUV0GcQY8tXvfS1VwcSW2TjMZSr3rKqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728477689; c=relaxed/simple;
	bh=s4G4JSu1QOCRRR6z4OBsb67nQBTp9ImH59z4hHQnoGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tInMX9pPhaSqdy9hwkmXRohQPkbz1ZBMoxemLThoIVbgK+pyYEbeGbVsiuKhDu7MLeew+9uHawFxcGtdIKPH1cZE1MXEHiVzClDZXtVtgDDnEAdn3hB98agB3URreXDdxNIRDQI3uqKN7dBh6IqIL1kKAKBU3ghaAJ1pjV1R/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMMXjl6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A3EC4CEC5;
	Wed,  9 Oct 2024 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728477689;
	bh=s4G4JSu1QOCRRR6z4OBsb67nQBTp9ImH59z4hHQnoGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMMXjl6GnRDYPp/JPPfxJW1ddSLOvTfC61+BJHCOUinvjubVwQdAn8En6kK0CEmg9
	 zKDYG92GNO2SJuuHhBsMzbW94ramCgMYn3+kY0UTuE0t91PCrJKp47qr1gay4+0QIG
	 wC0TmxghXsk9yEhjJ4eOZQSROnYgkAkq5LHpsyfIiG5qsMH94Zr1Cc/4QeQXH5zugM
	 06vlYqhDNiXna01XcYPIENg7qZryL4DTS7EbdOzBy2YskuII9ToT35kJgEqUwBRz5x
	 iU+VPSpHiPWqerR6ldrvqAGpTYAL/PbFIMd/4ffCZK3JaDYelQUhPslpFTzoLypqs3
	 WLta3xPkyweVg==
Date: Wed, 9 Oct 2024 13:41:25 +0100
From: Simon Horman <horms@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	donald.hunter@redhat.com, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH net-next v4] doc: net: Fix .rst rendering of
 net_cachelines pages
Message-ID: <20241009124125.GS99782@kernel.org>
References: <20241008165329.45647-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008165329.45647-1-donald.hunter@gmail.com>

On Tue, Oct 08, 2024 at 05:53:29PM +0100, Donald Hunter wrote:
> The doc pages under /networking/net_cachelines are unreadable because
> they lack .rst formatting for the tabular text.
> 
> Add simple table markup and tidy up the table contents:
> 
> - remove dashes that represent empty cells because they render
>   as bullets and are not needed
> - replace 'struct_*' with 'struct *' in the first column so that
>   sphinx can render links for any structs that appear in the docs
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


