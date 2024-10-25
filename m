Return-Path: <linux-doc+bounces-28677-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC89B122F
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 00:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B9431C212C6
	for <lists+linux-doc@lfdr.de>; Fri, 25 Oct 2024 22:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4FA1D26F1;
	Fri, 25 Oct 2024 22:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OUjs1JT9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F0217F59
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 22:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729893628; cv=none; b=hMFrCNtDism/Dy33TVzft56mIos72qFa4CXzC8LMzl21w5xLyj8ksjVnbKexIAP1yNSx9p6BnMqENNhM2/oEn+xaDZY0O/OZTFpPICIp8qZpWRj5zR3LE3ds+goYa/MNiPNWUmujJzO/0fE27U78r4nLdFl7DLn8mvDVqwSScPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729893628; c=relaxed/simple;
	bh=HBpmSLTHLDBgIa6A7oACwD7dS8Vcl5YtVfNX8GeXojk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBwkbnLLL7N3lN4jPAoD5V23bUhjHxY4m8urlQ9RQAK82pYjRq3sXfDpkGQwCr3nbLUyqZj2wOhr96xGNp5mvo7lJSyzCtimp4f8ngDg2HMRqYVOeT94VWcVf0lIBRyeVN1Vi7PNx8Y5WP1aNX78Y7/QVz1Z8RLvGQoxSz5QKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OUjs1JT9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so24563825e9.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 15:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1729893623; x=1730498423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMYIbp2l0TjUPEVUIVL+pQQjTdciemM4Uf5wbNfybZs=;
        b=OUjs1JT9uEoaXDc8DAX6Cg8xQ10J0Vg1orqyfAxa4Rsu9SHfd430GQ2sm9LI8D6IX3
         86vIYDELoG8O57Zo6kLb+CvgeqFqwM5tyVvD8kEk5l1GLz61sSn3HdthXy/kisBrlGjF
         t/hEagLFWCS0ySfR2NxoCbDslbHiF/xgPH+vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729893623; x=1730498423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMYIbp2l0TjUPEVUIVL+pQQjTdciemM4Uf5wbNfybZs=;
        b=DmMlCUqnGP4NzwPR6WDfFjsLrPfZxqXMQk7RErk4aezK+o5boBmNroloOor9nzXjhm
         FqTpO5cppWrxrl68jAF7tSBMsDSMyY4GygDn4A+8TGGAjzBaXlmuTURotO7wlP32Xrpw
         9iSd+OkCzNJfObswvrHl76fly2yrvhBnWIMyaZjZmr+RV0bJ2bNa2EK5IZ+n+wVm5sXl
         gdLCOoGzUFOTwZ3zgFkAxl+80mFS9a9WzSxatD4nc+3lIZn2ypfTS8/floPq4IP7McSY
         wEwddqoXMQyfHDheLPKw8Mw0bGzJmHovMfuybCfeLEJwV0OKz0UTCjrJHg6lMkydlVV7
         AypA==
X-Forwarded-Encrypted: i=1; AJvYcCWSwxEepJ4zDxp2hmsTmdGHD6uW5j84gib8pPp/jJv+NLFT5lToJRTd0RuiXFDFKvnJRT49PM7ZCfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEOypYUaJxD7PVEqcIK7ke+PL89XsvnGdXQHleTjH8gI8/ck4
	1sgZ7F/yNT1nqn6BUeDvWEsurRAwmIEOSneJZ2f9gliWAOJ6iFcVumMvt0AEU8y4rTS2FkMiee2
	11HirPPTMVzQbb/dIb5tqKJBvx3tRoPm3xQ0C
X-Google-Smtp-Source: AGHT+IFzITeU8qyhbB4d9w/5cfBuhuszxu8tUWx8+nlxG28DwvV0d4xdtjrBddEBAtKT8lDNSO/mBcU7sMLrX0tRDDI=
X-Received: by 2002:a5d:4084:0:b0:37d:37b8:3778 with SMTP id
 ffacd0b85a97d-380611eec34mr612129f8f.45.1729893623254; Fri, 25 Oct 2024
 15:00:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022162359.2713094-1-ap420073@gmail.com> <20241022162359.2713094-3-ap420073@gmail.com>
 <CACKFLikBKi2jBNG6_O1uFUmMwfBC30ef5AG4ACjVv_K=vv38PA@mail.gmail.com> <ZxvwZmJsdFOStYcV@JRM7P7Q02P.dhcp.broadcom.net>
In-Reply-To: <ZxvwZmJsdFOStYcV@JRM7P7Q02P.dhcp.broadcom.net>
From: Michael Chan <michael.chan@broadcom.com>
Date: Fri, 25 Oct 2024 15:00:11 -0700
Message-ID: <CACKFLinbsMQE1jb0G-7iMKAo4ZMKp42xiSCZ0XznBV9pDAs3-g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/8] bnxt_en: add support for tcp-data-split
 ethtool command
To: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Cc: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, edumazet@google.com, almasrymina@google.com, 
	donald.hunter@gmail.com, corbet@lwn.net, andrew+netdev@lunn.ch, 
	hawk@kernel.org, ilias.apalodimas@linaro.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, dw@davidwei.uk, 
	sdf@fomichev.me, asml.silence@gmail.com, brett.creeley@amd.com, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f206010625543e70"

--000000000000f206010625543e70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 12:24=E2=80=AFPM Andy Gospodarek
<andrew.gospodarek@broadcom.com> wrote:
>
> On Thu, Oct 24, 2024 at 10:02:30PM -0700, Michael Chan wrote:
> > On Tue, Oct 22, 2024 at 9:24=E2=80=AFAM Taehee Yoo <ap420073@gmail.com>=
 wrote:
> > >
> > > NICs that uses bnxt_en driver supports tcp-data-split feature by the
> > > name of HDS(header-data-split).
> > > But there is no implementation for the HDS to enable or disable by
> > > ethtool.
> > > Only getting the current HDS status is implemented and The HDS is jus=
t
> > > automatically enabled only when either LRO, HW-GRO, or JUMBO is enabl=
ed.
> > > The hds_threshold follows rx-copybreak value. and it was unchangeable=
.
> > >
> > > This implements `ethtool -G <interface name> tcp-data-split <value>`
> > > command option.
> > > The value can be <on>, <off>, and <auto> but the <auto> will be
> > > automatically changed to <on>.
> > >
> > > HDS feature relies on the aggregation ring.
> > > So, if HDS is enabled, the bnxt_en driver initializes the aggregation
> > > ring.
> > > This is the reason why BNXT_FLAG_AGG_RINGS contains HDS condition.
> > >
> > > Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> > > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> > > ---
> > >
> > > v4:
> > >  - Do not support disable tcp-data-split.
> > >  - Add Test tag from Stanislav.
> > >
> > > v3:
> > >  - No changes.
> > >
> > > v2:
> > >  - Do not set hds_threshold to 0.
> > >
> > >  drivers/net/ethernet/broadcom/bnxt/bnxt.c         |  8 +++-----
> > >  drivers/net/ethernet/broadcom/bnxt/bnxt.h         |  5 +++--
> > >  drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 13 +++++++++++++
> > >  3 files changed, 19 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/=
ethernet/broadcom/bnxt/bnxt.c
> > > index 0f5fe9ba691d..91ea42ff9b17 100644
> > > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> >
> > > @@ -6420,15 +6420,13 @@ static int bnxt_hwrm_vnic_set_hds(struct bnxt=
 *bp, struct bnxt_vnic_info *vnic)
> > >
> > >         req->flags =3D cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_JUMBO_=
PLACEMENT);
> > >         req->enables =3D cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_JU=
MBO_THRESH_VALID);
> > > +       req->jumbo_thresh =3D cpu_to_le16(bp->rx_buf_use_size);
> > >
> > > -       if (BNXT_RX_PAGE_MODE(bp)) {
> > > -               req->jumbo_thresh =3D cpu_to_le16(bp->rx_buf_use_size=
);
> >
> > Please explain why this "if" condition is removed.
> > BNXT_RX_PAGE_MODE() means that we are in XDP mode and we currently
> > don't support HDS in XDP mode.  Added Andy Gospo to CC so he can also
> > comment.
> >
>
> In bnxt_set_rx_skb_mode we set BNXT_FLAG_RX_PAGE_MODE and clear
> BNXT_FLAG_AGG_RINGS

The BNXT_FLAG_AGG_RINGS flag is true if the JUMBO, GRO, or LRO flag is
set.  So even though it is initially cleared in
bnxt_set_rx_skb_mode(), we'll set the JUMBO flag if we are in
multi-buffer XDP mode.  Again, we don't enable HDS in any XDP mode so
I think we need to keep the original logic here to skip setting the
HDS threshold if BNXT_FLAG_RX_PAGE_MODE is set.

> , so this should work.  The only issue is that we
> have spots in the driver where we check BNXT_RX_PAGE_MODE(bp) to
> indicate that XDP single-buffer mode is enabled on the device.
>
> If you need to respin this series I would prefer that the change is like
> below to key off the page mode being disabled and BNXT_FLAG_AGG_RINGS
> being enabled to setup HDS.  This will serve as a reminder that this is
> for XDP.
>
> @@ -6418,15 +6418,13 @@ static int bnxt_hwrm_vnic_set_hds(struct bnxt *bp=
, struct bnxt_vnic_info *vnic)
>
>         req->flags =3D cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_JUMBO_PLAC=
EMENT);
>         req->enables =3D cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_JUMBO_=
THRESH_VALID);
> +       req->jumbo_thresh =3D cpu_to_le16(bp->rx_buf_use_size);
>
> -       if (BNXT_RX_PAGE_MODE(bp)) {
> -               req->jumbo_thresh =3D cpu_to_le16(bp->rx_buf_use_size);
> -       } else {
> +       if (!BNXT_RX_PAGE_MODE(bp) && (bp->flags & BNXT_FLAG_AGG_RINGS)) =
{
>                 req->flags |=3D cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_H=
DS_IPV4 |
>                                           VNIC_PLCMODES_CFG_REQ_FLAGS_HDS=
_IPV6);
>                 req->enables |=3D
>                         cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_HDS_THR=
ESHOLD_VALID);
> -               req->jumbo_thresh =3D cpu_to_le16(bp->rx_copy_thresh);
>                 req->hds_threshold =3D cpu_to_le16(bp->rx_copy_thresh);
>         }
>         req->vnic_id =3D cpu_to_le32(vnic->fw_vnic_id);
>

--000000000000f206010625543e70
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
OnaLEot1MoQO7BIe5S9H4AcCEXXcrJJiAtMCl47ARpyHmvQFQFFTrHgUYEd9V+9bOzY7MBIGSV1N
/JfsT1sZw6HT0lJkSQefhPGpBniAob62DJP3qr11tu8CAwEAAaOCAdowggHWMA4GA1UdDwEB/wQE
AwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUuZ2xvYmFs
c2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggrBgEFBQcw
AYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAw
TQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2Jh
bHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDov
L2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU31rAyTdZweIF0tJTFYwfOv2w
L4QwDQYJKoZIhvcNAQELBQADggEBACcuyaGmk0NSZ7Kio7O7WSZ0j0f9xXcBnLbJvQXFYM7JI5uS
kw5ozATEN5gfmNIe0AHzqwoYjAf3x8Dv2w7HgyrxWdpjTKQFv5jojxa3A5LVuM8mhPGZfR/L5jSk
5xc3llsKqrWI4ov4JyW79p0E99gfPA6Waixoavxvv1CZBQ4Stu7N660kTu9sJrACf20E+hdKLoiU
hd5wiQXo9B2ncm5P3jFLYLBmPltIn/uzdiYpFj+E9kS9XYDd+boBZhN1Vh0296zLQZobLfKFzClo
E6IFyTTANonrXvCRgodKS+QJEH8Syu2jSKe023aVemkuZjzvPK7o9iU7BKkPG2pzLPgxggJtMIIC
aQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQD
EyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxeQGjDntHGb2iaQkIw
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIL/KrRYacg5SUEwm++sozU03tvddGrAC
eO7emsJ9iZM3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTAy
NTIyMDAyM1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQAeqGMDwcfSOAB9wYwWJuMyEssaW6vEKKqBYZOFIOhPVb19qeHF
oDB+al83LG6ru/tHUhrmONqN1BMYeaUhTg9xSeDblvFGTF+7Bsr9P8Qc9DpZ8K0JJUQhfxiZ9/tQ
rGwS3xKfv+bRP8O/AtB94G79WR+QHm/+/EID2REt1TnXNbwBCVKDeNtzHbb2Wf1AwekD2e3a+KZr
xcpgsUTRHZyg6Dtb8n8sxbv29ibRmLtRZaztZW+bLJA63I/fWl6TqHMX2hVTWi96ZybKssbPjGRw
Gjm1G0oDU4b084/1ZwV7twcAT54RpWKo/y5yDiIEoeaPhUpqPHTA4/uupPaeJ4e2
--000000000000f206010625543e70--

