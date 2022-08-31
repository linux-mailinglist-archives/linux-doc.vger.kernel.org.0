Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F2A5A872A
	for <lists+linux-doc@lfdr.de>; Wed, 31 Aug 2022 22:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiHaUAR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Aug 2022 16:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbiHaUAQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Aug 2022 16:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C2E760FD
        for <linux-doc@vger.kernel.org>; Wed, 31 Aug 2022 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661976013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NZSBGjtmVjGMgM+CxXs9jtX0UzV7LjjMgYj58UR9vM0=;
        b=VD+8TV6hieXo5ZoJrQ+BDJZw2oEyP7GSLaQ4Ab2yP6b2BE7lL5+wM4wdPnde/P5DB/R0yk
        y0ARQPJ0St2SthoPwmEuVa/Sthj3axOY4i+QuB8A8QFfXkCERgBaHjMNmrr0bnjBxc/s8a
        Fqfz60hWz96CyeMIfaJtzka3/VwuzQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-mvcKhCd7Memq8jXq-lDU4w-1; Wed, 31 Aug 2022 16:00:09 -0400
X-MC-Unique: mvcKhCd7Memq8jXq-lDU4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F04A9964082;
        Wed, 31 Aug 2022 20:00:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 40B702166B2A;
        Wed, 31 Aug 2022 20:00:07 +0000 (UTC)
Date:   Wed, 31 Aug 2022 16:00:06 -0400
From:   Stefan Hajnoczi <stefanha@redhat.com>
To:     Ziyang Zhang <ZiyangZhang@linux.alibaba.com>
Cc:     Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Richard W . M . Jones" <rjones@redhat.com>,
        Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
Subject: Re: [PATCH] Docs: ublk: add ublk document
Message-ID: <Yw+9xkKx6cgeiSyN@fedora>
References: <20220828045003.537131-1-ming.lei@redhat.com>
 <Yw4rcz23R3ofn6H6@fedora>
 <e9df4ed8-a0ea-661f-9947-b18fa1d2145f@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cC3A+mjn3pxIXJxb"
Content-Disposition: inline
In-Reply-To: <e9df4ed8-a0ea-661f-9947-b18fa1d2145f@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--cC3A+mjn3pxIXJxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2022 at 02:31:12PM +0800, Ziyang Zhang wrote:
> On 2022/8/30 23:23, Stefan Hajnoczi wrote:
> > On Sun, Aug 28, 2022 at 12:50:03PM +0800, Ming Lei wrote:
> >> +- UBLK_IO_NEED_GET_DATA
> >> +  ublksrv pre-allocates IO buffer for each IO at default, any new pro=
ject
> >> +  should use this IO buffer to communicate with ublk driver. But exis=
ted
> >> +  project may not work or be changed to in this way, so add this comm=
and
> >> +  to provide chance for userspace to use its existed buffer for handl=
ing
> >> +  IO.
> >=20
> > I find it hard to understand this paragraph. It seems the
> > UBLK_IO_NEED_GET_DATA command allows userspace to set up something
> > related to IO buffers. What exactly does this command do?
>=20
> Let me explain UBLK_IO_NEED_GET_DATA since it is designed by myself.
>=20
> Without UBLK_IO_NEED_GET_DATA, ublk_drv will copy data from biovecs
> into a pre-allocated buffer(addr is passed with the last COMMIT_AMD_FETCH=
 ioucmd)
> while processing a WRITE request. Please consider two cases:
>=20
> (1)  if the backend(such as a dist-storage system using RPC) provides the=
 data
>      buffer, it has to provide the buffer IN ADVANCE(before sending the l=
ast
>      COMMIT_AMD_FETCH) without knowing any knowledge of this incoming req=
uest.
>      This makes existing backend very hard to adapt to ublk because they =
may
>      want to know the data length or other attributes of the new request.
>=20
> (2) If the backend does not provide the data buffer IN ADVANCE, ublksrv m=
ust
>     pre-allocates data buffer. So a additional data copy from ublksrv to
>     the backend(such as a RPC mempool) is unavoidable.
>=20
> With UBLK_IO_NEED_GET_DATA, the WRITE request will be firstly issued to u=
blksrv
> without data copy. Then, backend gets the request and it can allocate data
> buffer and embed its addr inside a new ioucmd. After the kernel driver ge=
ts the
> ioucmd, the data copy happens(from biovecs to backend's buffer). Finally,
> the backend gets the request again with data to be written and it can tru=
ly
> handle the request.

Thanks for the explanation. Maybe it can be included in the
documentation.

This reminds me of io_uring's IOSQE_BUFFER_SELECT where userspace
provides the kernel with a buffer pool and the kernel selects buffers.
It doesn't require an extra io_uring command roundtrip
(UBLK_IO_NEED_GET_DATA).

Did you already look at IOSQE_BUFFER_SELECT and decide a similar
approach won't work for your use case?

Stefan

--cC3A+mjn3pxIXJxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMPvcYACgkQnKSrs4Gr
c8jgfgf/QEpkKMLMe8nPNb1uSxKF82wwizozhSZjPK3s/hWDuH8q26FDCmtJcCrD
9vanvREyKgUcRxhsDDcly0ng0groWGNZEB1j2zvdmHE9AwizLoQIFcdmPXlNEcwu
1i8L7m8pJIpQ+ED9eMBv0mfgRuXK5JqD5DteSvDF/vqfcgkBvFr14yaBdTyKm7UX
Id+/jNhzEeIK/I5vQ5C5nuHQrHPF5M5Rlu9YPLiVKa5o/mjK8G5AoaZcA8Jn4KID
t6BSWE8NUWTHWcThz1JH96d1MZhx3neF86WpBMhiSYMSnNFa1kXPUdxD3IKUh6tO
oQErGxR8YERTSLYkOVOWOncTCmr5UA==
=AVxB
-----END PGP SIGNATURE-----

--cC3A+mjn3pxIXJxb--

