Return-Path: <linux-doc+bounces-13300-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87360895DD3
	for <lists+linux-doc@lfdr.de>; Tue,  2 Apr 2024 22:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C25C28ABDA
	for <lists+linux-doc@lfdr.de>; Tue,  2 Apr 2024 20:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB1415E5D2;
	Tue,  2 Apr 2024 20:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQjrQN2x"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB13415EFA4
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 20:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712090089; cv=none; b=gYcL88Q5qYnHCeOc8GJsNgfv3nVct3/gafTG/IHhBQ97qTEBVfeQVEeNEq50K9UfFLoJ3VEhYH25yX5v+SeBMoFKUf4FdhMP5oqmwlJ9FGqa5dxTRM0E2tmhu1fVykUapm7EH0ZeaIcaRlh+0KpHXC1iXl/LHt2O6AOx9m2/GYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712090089; c=relaxed/simple;
	bh=PbCYgrPVbVOdhV1jC/4KII4virJ8WGK/ifPusT5Ym9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXV+fklMoqEu5Qt+Z6VhGQe9xhFq2nUTOiDFIQ7FnkRzAVV8dSsYby/h5Jpv+7AYp1VWbBQ/n10SU33a2a06BFbTwj+9QVTwceZ7N+ZP0liWGt0IEk1FNyPLNUWQ007U5ezmC8vxZuuPwdVVpPcJC8afxRh9Ye+cOh8ROF40Y4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQjrQN2x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712090087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmliKS7IXk0y+y9ssPc7arVQxLqF15p8TNQCcmbmlpA=;
	b=NQjrQN2xVA4KRHrFmx3vAO0oSYGP+KWFD2MnCejQcH+DKJjaGo7pBVAxS++JYY4YqOwtZS
	e5CzciIr8A90fBC9n7VNeNUrM3DiGYr8T4YAFolF8rw7rlyi6PFBcOR/6IycUMg9XOY0z1
	kILFx3MFwpugCv/FEtDoh1nANNpz01c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-0Tm61sA2Nw-68qBkgUVZgw-1; Tue, 02 Apr 2024 16:34:40 -0400
X-MC-Unique: 0Tm61sA2Nw-68qBkgUVZgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF21F101A520;
	Tue,  2 Apr 2024 20:34:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A6D640C6DAE;
	Tue,  2 Apr 2024 20:34:37 +0000 (UTC)
Date: Tue, 2 Apr 2024 16:34:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gonglei <arei.gonglei@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	David Airlie <airlied@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Graf <graf@amazon.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kalle Valo <kvalo@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev,
	kvm@vger.kernel.org, linux-wireless@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 24/25] fuse: virtio: drop owner assignment
Message-ID: <20240402203418.GG2507314@fedora>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
 <20240331-module-owner-virtio-v2-24-98f04bfaf46a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2TTKZujScqhsi/4"
Content-Disposition: inline
In-Reply-To: <20240331-module-owner-virtio-v2-24-98f04bfaf46a@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2


--y2TTKZujScqhsi/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2024 at 10:44:11AM +0200, Krzysztof Kozlowski wrote:
> virtio core already sets the .owner, so driver does not need to.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Depends on the first patch.
> ---
>  fs/fuse/virtio_fs.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--y2TTKZujScqhsi/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmYMa8oACgkQnKSrs4Gr
c8hVnAf/cA3xbyK70jAgkZV9EtimcENA8Vicjc5wwuE2Vt1WSOZUWtD+a8KtqIDS
ICvCIk7XlMHoB7BYaP8qlXQ0kjkARmT7hwEQyqEDL/MzEgyKhChus/pV8g6Cvywl
OdPkT57aujxEBU5+l5t8TnP2I8CziPoDf0uizIpf5r2pZstP0q/mRVNFevjTDeSu
L+LjxHElpmAVApGciiGOH+cpPYuKAejObzy5z92m7jZgh/LfHtcK29bhoWwNTL1l
e6ryz/B2YrpyrVdDjqUD1iJ2WR2qxEUAI3moU5ySGqG/w5Lg0+ji+9TlCE46xoQ/
U1ALdKDyNFUB1iRXdA00oKhEe6MUOw==
=AQF3
-----END PGP SIGNATURE-----

--y2TTKZujScqhsi/4--


