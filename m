Return-Path: <linux-doc+bounces-85728-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPCLM5z2+GmH3gIAu9opvQ
	(envelope-from <linux-doc+bounces-85728-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 21:42:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C564C3537
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 21:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84866301589F
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 19:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BA23FADEF;
	Mon,  4 May 2026 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE9SDWfQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39F3DDDAE;
	Mon,  4 May 2026 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777923735; cv=none; b=PWNrO2dLq+tGBZ0tYeE2+9PVS+oMWvKWMPeu+2t99yEkgJIh+kXN9s/wnL+1XN9HqlmtG3PH6O+eXXGVHmHssMlHtVqe6CEn3MnJVRsHOJMcrOFOdldM0M6OJswWwyQlrHv9csJvZd1O4QCxQyR5ptKYJj6zKm3CJDvTyKOcbgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777923735; c=relaxed/simple;
	bh=2t8eYSnq0vCaib0IOLian329tB/t0se5+Jb2OTmsQn8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lxCJvJeBqkgekpwDpD3T380wUlXticrmBr/wb4PqG7TTnrlqGgbcAeoqr8fDNtfNdmsOMByen1A9/Ut5oaPBw7gIDJIH35De7eoLVg1Wbw7RF1iyCmlBXI1Lk+NHwi8zv5A9IBUpm0gVjWd+pDogammFdkZlyjK4b04OKj/FlAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE9SDWfQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E86C8C2BCB8;
	Mon,  4 May 2026 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777923734;
	bh=2t8eYSnq0vCaib0IOLian329tB/t0se5+Jb2OTmsQn8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VE9SDWfQdL8AYRxgta9nD/C3swhBTpOnocQyqvoyAOrO87/PVXrikJPqfz2Wa2iYw
	 eFVXDiyDBDIrniWTz7oHhdxKIBSh9KeZQl72HxEuunddZuSRFKoAg7yCo/J3LQtcIY
	 GLrhYT2M2TA3jWoAKQQ2ibTaHeTwA5laaEI5zx3SVdq4MkAtJ2X+ag5bYU1z8XSlTk
	 p20AJZxLNpTP7Q79lmJaPcVQDy+ArZpPhP7Me5eHsqjM2lxJr8Qaw8u3xSJirXjW2w
	 Wop5WCe+H/f1/N+grDH1zv+taphhCDqLVbpIYDgAQvjDVRgxRoZ58OME0ZWE7ayrve
	 Kcu5B8tJBerTg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 21:42:07 +0200
Message-Id: <DIA5D0RYRE24.2LB65BF0UK4UI@kernel.org>
Subject: Re: [PATCH v12 12/22] gpu: nova-core: mm: Add page table entry
 operation traits
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy Baron"
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie" <airlied@redhat.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, "Nikola Djukic" <ndjukic@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <joel@joelfernandes.org>,
 <linux-doc@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260425211454.174696-1-joelagnelf@nvidia.com>
 <20260425211454.174696-13-joelagnelf@nvidia.com>
 <DI8B0IOXNP2L.1NFX4OTABNHA0@nvidia.com>
 <53c88538-dca7-41f1-bb2b-856035728c69@nvidia.com>
 <DI9YR10HH6PE.AMLEZUV7701V@nvidia.com>
 <bd210abc-590f-4011-8337-21b54780fd4c@nvidia.com>
In-Reply-To: <bd210abc-590f-4011-8337-21b54780fd4c@nvidia.com>
X-Rspamd-Queue-Id: 45C564C3537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85728-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,lists.freedesktop.org,lists.linux.dev,gmail.com,joelfernandes.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon May 4, 2026 at 9:28 PM CEST, Joel Fernandes wrote:
> We are already at v12 now

To be fair, the series is actually at v6, as you initially added those patc=
hes
to another series that was at v6 already back then, and then you decided to=
 just
keep going with it. So, nothing too crazy going on that front. :-)

