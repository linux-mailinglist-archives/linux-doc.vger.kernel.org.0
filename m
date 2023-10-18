Return-Path: <linux-doc+bounces-470-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D976A7CD138
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 02:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 138DA1C208E1
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 00:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1383625;
	Wed, 18 Oct 2023 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZErzBCjB"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9665C39B;
	Wed, 18 Oct 2023 00:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E1CC433C8;
	Wed, 18 Oct 2023 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697588524;
	bh=yvDrPqrXntymzsv0rV2G8oAfgBeUR+LCbtYO+Qqupro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZErzBCjBWkKqnZ2uoBXRSMcxqK0E5vIC8VwutpgZZ5CnxzSAKPfNI4A4A0m4AIdq2
	 LLaGLvPPVWEgPFE5AKOnQrEb0LPy30+HpbIvfeMCLZ3ZcjrpygBGB2onYesMHCH/xk
	 bCKixTeOsz0TXYtUYsd1JlvwHjl/6dZLPS5jagXjFY2hjdoZSGhCXo0qYpLbfz0ERJ
	 VhX1oLBYcte70RovBCZ4kydaadCcUfGRpAXLd6Cninv4DirciN4uL5WBqB1ZuKDDG0
	 Oecge2AQLahA1HUwHxKOqzAzxoGtzIi+E2uyhEOyzwFbWGzctTgqucrcCPrW+n/KBh
	 jBmyKu4q0Wpbw==
Date: Tue, 17 Oct 2023 17:22:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: netdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 linux-wpan@vger.kernel.org, Michael Hennerich
 <michael.hennerich@analog.com>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>,
 Rodolfo Zitellini <rwz@xhero.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 01/10] appletalk: make localtalk and ppp support
 conditional
Message-ID: <20231017172202.71c8dcf9@kernel.org>
In-Reply-To: <20231011140225.253106-1-arnd@kernel.org>
References: <20231011140225.253106-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Oct 2023 16:02:16 +0200 Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The last localtalk driver is gone now, and ppp support was never fully
> merged, but the code to support them for phase1 networking still calls
> the deprecated .ndo_do_ioctl() helper.
> 
> In order to better isolate the localtalk and ppp portions of appletalk,
> guard all of the corresponding code with CONFIG_DEV_APPLETALK checks,
> including a preprocessor conditional that guards the internal ioctl calls.
> 
> This is currently all dead code and will now be left out of the
> module since this Kconfig symbol is always undefined, but there are
> plans to add a new driver for localtalk again in the future. When
> that happens, the logic can be cleaned up to work properly without
> the need for the ioctl.

Hi Arnd, the WiFi changes are now in net, could you rebase & repost?

