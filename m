Return-Path: <linux-doc+bounces-33406-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5179F889D
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 00:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11D31669F1
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 23:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFF71D8E09;
	Thu, 19 Dec 2024 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Yl22e4HG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88221853
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734651692; cv=none; b=f2JcZlW87fKBGoyo8CujaXvRTg1OJt/2eUMcVTTomNnouHWyMI1iMZPOyZgzWfkgDEl6kcGKJWWwbq4asajTqlluYgfVWpOObKgitTBQ3rcmuHjtFiFKn/f7hbOse0Lyhs3Bq4H28FpP188owtUifmxwR/GMZkZWZUGUAjB4zlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734651692; c=relaxed/simple;
	bh=JL0HldY1pg7ZTEsT1unvM8E/w2xTS9IJieeLNZlAsJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nfm+ztOPzvkKzQ+9XxR3kqS1bxL30YcNEOI5k13p6gWjcHI4Oc/QMLF29aGEV0j8RZdhw5KQvvzr95ELuNss5HNemuColifo3pV1G4uG7Q2/5wcqdbhO50NPOL1MJCDSSFqZZHQvtYpdYyN2+Eg6i0nwoWTQP0XwocdvAhht/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Yl22e4HG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so1920054a12.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 15:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734651689; x=1735256489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZDrVVpJ6lIRVSaklaLGYo9E5jNKI7cUVuNaJES+reg=;
        b=Yl22e4HGsk24rWzjVpH0wG8vcebQEWbQMibd7gKRzAOfjqiqys71aj29FrmaO0mda1
         m5icRAMg524HibLb2H2d7+Wd1tbAUId/LEHoaLQHmObZB0Pji5rQWJ9MFbxiM1vi07q8
         lSqv2cPAwuQ3JGJ/tnXCJF4yWrBZGkUBGSRTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734651689; x=1735256489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZDrVVpJ6lIRVSaklaLGYo9E5jNKI7cUVuNaJES+reg=;
        b=j7DkaAM7wfvIiD6A42P37E/aTwIiF9F5jmVb9MzblbhdxUyih7APcM44Yv0s1Ot7mI
         cRRPZZ56GUU9j7/zIOkpziUvlLgwcfjWSPPiEAvefzU3kQYmsAOlxfedGvtQ+LUnDaO0
         AsJAov9bqIylK/ybS+KdAYpO8hfMN4VrcQEUe1z1V5BFQrrLaqfkWqn9HB5maec/5+I4
         oFEXtnxvgOb4/cAixx+EF/wvw4tnEAYGxAXN+Vn3+z0UJoLdSazI7GR2zoJoy+TJcLSc
         HUW9YashjGzepCWDM9WDoD2qKG+AD9iAMgmLd5zmPIFh6U1DRJbrjXqrqs7JN0f1FD8L
         wH+w==
X-Forwarded-Encrypted: i=1; AJvYcCWqQEVR0dYI/SGyjfXi6noshRzUxEEyz1Tf75GlNme5hoAlrdt/SoiyDJHZJIhDE0vRWOCUg+KpwM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNZbdIb+oHprS4mDVCJ6SEUApeq+f0ED8r9JAJKBj0dEV1ebw
	p8ulA1fGwqPRXX8ihAuEKzkPBi/Fxm97Jueso+Mdp/NOoNOodfbl5idMQkskrbV9tL0GvyIbfYb
	dCZeazfacu1y5Zjxch79wiUMp9WBaKthB9Yi3
X-Gm-Gg: ASbGncvfgpbsCeYzwnIvQ7szPwP7gn6eha+2VzoDL7yPAuxvzzp88g+izkGZsv+aIUx
	uHTvvnXa3aS7lzVEAtQnMdQoNzkc9of/h9mKo8s4=
X-Google-Smtp-Source: AGHT+IGaoQrUWyLJNQiMpuxwtC3GnHPLv3rva1m1n9dwrEkiMlRXzNwgtDyo9UeFbJwH3y+KpEXG3bUTSVRTZaM0j4A=
X-Received: by 2002:a05:6402:2813:b0:5d3:d7ae:a893 with SMTP id
 4fb4d7f45d1cf-5d81de23133mr481446a12.25.1734651688990; Thu, 19 Dec 2024
 15:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218144530.2963326-1-ap420073@gmail.com> <20241218144530.2963326-4-ap420073@gmail.com>
 <20241218182547.177d83f8@kernel.org> <CAMArcTXAm9_zMN0g_2pECbz3855xN48wvkwrO0gnPovy92nt8g@mail.gmail.com>
 <20241219062942.0d84d992@kernel.org> <CAMArcTUToUPUceEFd0Xh_JL8kVZOX=rTarpy1iOAD5KvRWP5Fg@mail.gmail.com>
 <20241219072519.4f35de6e@kernel.org> <Z2R1GFOg1hapdfl-@JRM7P7Q02P.dhcp.broadcom.net>
 <20241219121841.3ed4de71@kernel.org>
In-Reply-To: <20241219121841.3ed4de71@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 19 Dec 2024 15:41:17 -0800
Message-ID: <CACKFLikUM=Vt1EeYEs_-amCmahak3nQPSbwz_v4T1pB=UShQ3w@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/9] bnxt_en: add support for tcp-data-split
 ethtool command
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andy Gospodarek <andrew.gospodarek@broadcom.com>, Taehee Yoo <ap420073@gmail.com>, 
	davem@davemloft.net, pabeni@redhat.com, edumazet@google.com, 
	almasrymina@google.com, donald.hunter@gmail.com, corbet@lwn.net, 
	andrew+netdev@lunn.ch, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	dw@davidwei.uk, sdf@fomichev.me, asml.silence@gmail.com, 
	brett.creeley@amd.com, linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	kory.maincent@bootlin.com, maxime.chevallier@bootlin.com, 
	danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com, 
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com, 
	rrameshbabu@nvidia.com, idosch@nvidia.com, jiri@resnulli.us, 
	bigeasy@linutronix.de, lorenzo@kernel.org, jdamato@fastly.com, 
	aleksander.lobakin@intel.com, kaiyuanz@google.com, willemb@google.com, 
	daniel.zahka@gmail.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c161430629a811c6"

--000000000000c161430629a811c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 12:18=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 19 Dec 2024 14:33:44 -0500 Andy Gospodarek wrote:
> > > I see it now in bnxt_set_rx_skb_mode. I guess with high MTU
> > > the device splits in some "dumb" way, at a fixed offset..
> > > You're right, we have to keep the check in the driver,
> > > at least for now.
> >
> > The mutlti-buffer implementation followed what was done at the time in
> > other drivers.  Is the 'dumb way' you mention this check?
> >
> >  4717                 if (dev->mtu > BNXT_MAX_PAGE_MODE_MTU) {
> >  4718                         bp->flags |=3D BNXT_FLAG_JUMBO;
> >  4719                         bp->rx_skb_func =3D bnxt_rx_multi_page_sk=
b;
> >  4720                 } else {
> >  4721                         bp->flags |=3D BNXT_FLAG_NO_AGG_RINGS;
> >  4722                         bp->rx_skb_func =3D bnxt_rx_page_skb;
> >  4723                 }
>
> Yes, that and my interpretation of the previous discussion let me to
> believe that the BNXT_FLAG_JUMBO does not enable header-data split.
> And speculating further I thought that perhaps the buffer split with
> jumbo > 4k is to fill first buffer completely, header+however much
> data fits.
>
> I could have misread the previous conversation (perhaps Michael meant
> XDP SB / PAGE_MODE when he was referring to XDP limitations?)

To clarify, my review comment applied to XDP SB and MB modes.  Andy's
MB implementation from 2022 disables HWGRO/LRO and HDS in XDP MB mode.
My comment was to preserve this implementation.

>
> Or maybe the HDS does happen with XDP MB but there is another
> limitation in the code?

HW doesn't know whether we're in XDP mode or not and can definitely do
HDS.  But again, HDS is disabled currently in any XDP mode.  Andy will
respond to discuss this further.  Long term, we may be able to enable
HDS in XDP MB mode, but for now I think we should disable it just to
keep it unchanged.

--000000000000c161430629a811c6
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
DQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIENY2hBlLtK9c7SJzNPLcBd1xBzVrsAY
D+FFizHYkwvSMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MTIx
OTIzNDEyOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQC
ATANBgkqhkiG9w0BAQEFAASCAQA78GqX+KuvmSmchpZoDKKp5FPn+Wk82POvZypk0uP+OIcET8D1
1vyXc82IXsBWLJnd4YXdQLiUvGl8DvPQViD9eFHV5Y0f3zJc/tDUrF23AFNgl/RmPn8o6tHLTRt7
Jv196kMCvBS7oi7zEtJmuHMPq8Z9x4g4Sr1r8Z1j9Lvmh2qInOOWTcm1v8WU5NmnLPkQJrPzddE/
mkEjfPOZQWEGKp7QINd1eKLuPJ6HQf969+ux4chshtfbNag+eIskRo05jAKiv2B0PnZ/JUKEtPBd
YjpGURWTy51SHzMy1dcBLCk8GbNuKQzAVLuXai4Ich+tUBUyIdE00oStCl9lDPUR
--000000000000c161430629a811c6--

