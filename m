Return-Path: <linux-doc+bounces-23186-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A1B956B15
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 14:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B5A32831E6
	for <lists+linux-doc@lfdr.de>; Mon, 19 Aug 2024 12:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6598016BE13;
	Mon, 19 Aug 2024 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="nJW55vb7"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpdh19-su.aruba.it (smtpdh19-su.aruba.it [62.149.155.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26CD16B3BD
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071394; cv=none; b=k9IRT2DNDbZTCb7gRIiiE29IA/CUl+yC7uNfa/siM/Dt0DdWin4L2qTtG1HYFQxvZ2C5jLoQFqcKLaj0a7nCqvbZ3M76un0xJUgNrojPrnovQvtg9lyS0SUAR2WP5TI+m4ymrdag0i5xnnCq2am2mnVjx3Oqi78KZ5VF12cVq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071394; c=relaxed/simple;
	bh=fCwrGowti2Y9FbC/WSwpnvpRmMD7BY8uWq1ug4s5oc8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pKERVYg/lEq5+nVSSmNs4h5NPJuFGk1/hYEXdeBR9K0VRpiYYBhMC7ZrdjzStbnMJUUxg6YbN0E0kMnsqp3NCorysfk98baEsYWg9SGkTaVIrkzsscIln/G/vdA19lv1W+6X6m6p4g8GbGIAaFrrE/tVnbfiSHr7yR1CFC+Af1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xhero.org; spf=pass smtp.mailfrom=xhero.org; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=nJW55vb7; arc=none smtp.client-ip=62.149.155.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xhero.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xhero.org
Received: from smtpclient.apple ([84.74.245.127])
	by Aruba Outgoing Smtp  with ESMTPSA
	id g1g0s7h89GPpWg1g0sdU1V; Mon, 19 Aug 2024 14:40:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1724071202; bh=fCwrGowti2Y9FbC/WSwpnvpRmMD7BY8uWq1ug4s5oc8=;
	h=Content-Type:Mime-Version:Subject:From:Date:To;
	b=nJW55vb7YjZ9SvT5UohbI0ldLpGL7iTCUUl2BFPCDHyHdhx67JckO7U+YIjO9qiqi
	 1/n4hQ2Io27dp5IktOT6100XMkmiMUSaIpupCH8GgLv5qwu62UNZLJjsmuINMdElg9
	 QlyRxP02OelucC1HgynnPQPKdym6EQyFQyGcLF8jNueoJsGoKiv8DtsEKI/GFr2sYT
	 t/QB9CO2RYTQPdABXVPSccdmcKt3GBbHfXbgMrzchnV5vPzlUQr+3KXyjvU2es7l9n
	 /Vf+HuZPPocMqxz5i8HkkkmT4E6uqJ7SJSgUU7Pza4JxF0WT4TGPZqKdva5Um7EFVi
	 G8sXyQ/2AWYww==
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH net-next 2/2] appletalk: tashtalk: Add LocalTalk line
 discipline driver for AppleTalk using a TashTalk adapter
From: Rodolfo Zitellini <rwz@xhero.org>
In-Reply-To: <f1c86ed3-9306-459d-acb5-97730bfeb265@app.fastmail.com>
Date: Mon, 19 Aug 2024 14:39:49 +0200
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Netdev <netdev@vger.kernel.org>,
 linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Doug Brown <doug@schmorgal.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <66CC3DF2-3877-4E59-924A-FA0B14AD4F46@xhero.org>
References: <20240817093316.9239-1-rwz@xhero.org>
 <f1c86ed3-9306-459d-acb5-97730bfeb265@app.fastmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3774.600.62)
X-CMAE-Envelope: MS4xfH4AXYnKIh2BVBscPttom5cXyZiRAjSs4ymV0/+jjynM3I2IRE/1MGshpfSSdbFowrwVfeP4DN6YlOMhpxI+Qi0PL2nobjWLqbHD+k5XaEaUJIN5Hkv/
 r+wriLFaK+M+lRHfpnFyvnmbJwYBKhq+tJ2ZisE16PCdtNdQIBKiE4ACgeUglF1xWI+KABKWZ5EtKnL3Sp/gPyhhu3q1nurJGLf5kyfIm2pCHsOYzWXwJvgI
 mxPfBcCbVQ3ognRSsA/+dIY+PG/+lhqKbdk7wDpDkBNg4cwo+/H9/Bl2mj2d1Hz3gplnytcLLw7VuUn7QeMUmi0TSQvC8pGNs2bCTWBiZdyjMvXTXRscTKBn
 HnncabPcsQHXoxw1a9rEr1YZ0nNDhO8fPU6i+WQd1YNS2PbK3N4t2TR4r3YeB9WLDN+FNquZugPlhCHpr05JPysJOFZb7ZCXRD9BbwyIKIADYJBdz9qOy6BT
 ryPhz6s76O7rUGfiB2DwVZstHElf/BxjxDhdt85QoNMkVV8HquANl9PBL3Rfkv5VOn0+4fNluLdTdgbUPGglUaOOvBDKIlAL6x96GA==

> On August 19, 2024, at 11:44 AM, Arnd Bergmann <arnd@arndb.de =
<mailto:arnd@arndb.de>> wrote:
> Nice to see you got this into a working state! I vaguely
> remember discussing this in the past, and suggesting you
> try a user space solution,

Hi Arnd, Simon and Jiri,
First and foremost, thank you so much for taking the time to review my =
code
and for providing your comments.
I will do my best to address the issues and improve the code for the
next submission.

I will also add a longer description on why I went this route, it is =
mostly
due to compatibility with existing distributions of netatalk 2, which =
can
work without modification.

> As we discussed in the past, I think this really should
> not use ndo_do_ioctl(), which instead should just disappear.

I will fix this in the next revision, I was not sure if I should touch =
the
appletalk code for my first submission, but I can add a third patch that
takes care of this.

Kind Regards,
Rodolfo=

