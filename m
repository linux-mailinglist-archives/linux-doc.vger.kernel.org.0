Return-Path: <linux-doc+bounces-28671-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A69B0EEB
	for <lists+linux-doc@lfdr.de>; Fri, 25 Oct 2024 21:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 801001F26FF8
	for <lists+linux-doc@lfdr.de>; Fri, 25 Oct 2024 19:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB36620EA56;
	Fri, 25 Oct 2024 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="epMUddw4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4D20EA5C
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729884278; cv=none; b=AJ9fTP82fMd/FQrb4blZhTpsKcps9AZWAhX6XrXv/IhCWlqb46GHZuwkFlz9HcRctE9QRB5XBotXvrRv5r5V6JjxR4zqWr25bulUjV7PQd/aoRVjyBlPNFC3460piqU5iwQFd8/qOlXt9kvLWAl7uf8JXAkq9gtAc0FdRRVGzlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729884278; c=relaxed/simple;
	bh=bebSZsoN40PwcYn49PXuYyxLVWUXlVwMcDX1wxDufWI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHH5nckBbhqJl8zTeWE73LLu8Kv5hdkjwr+pwLCnV3j3m+o2rhm6IVcav9SZ15oC34602ZNZcgJLXXajJser3XbqsLK/8FHpYpVnaKcLSI2hMyTdvgDyalLLURNUSzb1b4BgtUmZRHVddwh3qRES6K13lfZD3CmAorALPm/1EiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=epMUddw4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20e576dbc42so23711975ad.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1729884275; x=1730489075; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cz47o9yzNW0KvGOU6xsQutyz7avw4CsPNbkPxVqTrbU=;
        b=epMUddw4jB4RHdz1r0hDB40zAHeMh4dP8UqZdOP6aBXiDDrlZB0mEqNUhaNZVDeLbv
         Vw5fzK/Is8VbgpVAnIcPjN+h4vPW5ULBYisrkpIVqSuVLznNaEUSacsMo6v7WxyBvnGn
         JYP6NXOYrTAar+ZR8dbLNAnYnma6wKTx2pVV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729884275; x=1730489075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cz47o9yzNW0KvGOU6xsQutyz7avw4CsPNbkPxVqTrbU=;
        b=rvX1Qz7ptba7AjwfAOGsbIWyyy7g4UE5LMf/RYa3nu4ipx49VgGfLZjVwt79n9Sj6A
         crunzf3zz6dwYDCMLE1GBgzawaeDq8vZChlLz3XT0D7hOc4sjGHTyHiVvPtpPRAxKXgX
         cDR/rewtVuAwUaKp8bwF0dkftzOZiQVebuwCmijjPSoEzyAj2WT6v3kI1gqjCb1f+Tj/
         e9QdEIbaSaYsyuQGhpMSAbrfnCNP6HtGn7We99K6Ym9hbOJAc8v+OHAdc5L9Dh3sRPz/
         k+e06TwYJsiWXU0DIHFzV/zFoEZTqXjZEchiCRwjNEDoiWp1eSr0TTftJyl3+jVIwY9z
         sBzA==
X-Forwarded-Encrypted: i=1; AJvYcCX/+Fh3jGSpYcqU9Cr42rnuw4jaWG+RpFou04J1iPL5STnLRcWGqnheGXIzbBB5rEIQUkfbCtJTles=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTjh3gtf+kmzhqKUpnNwlMYyQdC6bbjwSkel874Fil4NOWdhP
	N7a5Fgxp8Axst11tdFv+YCLnkPrirCvFVKFw8WG6YcYTMrW37l3pedNakL5Kaw==
X-Google-Smtp-Source: AGHT+IF/pmHhfEwM1uFHYfAiRvfzD/X8MP05OgiVn+yw7RgVB/ZPqi/aoEMZjtwkKW/IJ57B7SH7Yg==
X-Received: by 2002:a17:903:2b06:b0:20c:5ba1:e8e5 with SMTP id d9443c01a7336-210c6c16f09mr2760435ad.19.1729884275414;
        Fri, 25 Oct 2024 12:24:35 -0700 (PDT)
Received: from JRM7P7Q02P.dhcp.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6df8csm12785615ad.99.2024.10.25.12.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 12:24:34 -0700 (PDT)
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
X-Google-Original-From: Andy Gospodarek <gospo@broadcom.com>
Date: Fri, 25 Oct 2024 15:24:22 -0400
To: Michael Chan <michael.chan@broadcom.com>
Cc: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@google.com, almasrymina@google.com,
	donald.hunter@gmail.com, corbet@lwn.net, andrew+netdev@lunn.ch,
	hawk@kernel.org, ilias.apalodimas@linaro.org, ast@kernel.org,
	daniel@iogearbox.net, john.fastabend@gmail.com, dw@davidwei.uk,
	sdf@fomichev.me, asml.silence@gmail.com, brett.creeley@amd.com,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	kory.maincent@bootlin.com, maxime.chevallier@bootlin.com,
	danieller@nvidia.com, hengqi@linux.alibaba.com,
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com,
	hkallweit1@gmail.com, ahmed.zaki@intel.com, rrameshbabu@nvidia.com,
	idosch@nvidia.com, jiri@resnulli.us, bigeasy@linutronix.de,
	lorenzo@kernel.org, jdamato@fastly.com,
	aleksander.lobakin@intel.com, kaiyuanz@google.com,
	willemb@google.com, daniel.zahka@gmail.com,
	Andrew Gospodarek <andrew.gospodarek@broadcom.com>
Subject: Re: [PATCH net-next v4 2/8] bnxt_en: add support for tcp-data-split
 ethtool command
Message-ID: <ZxvwZmJsdFOStYcV@JRM7P7Q02P.dhcp.broadcom.net>
References: <20241022162359.2713094-1-ap420073@gmail.com>
 <20241022162359.2713094-3-ap420073@gmail.com>
 <CACKFLikBKi2jBNG6_O1uFUmMwfBC30ef5AG4ACjVv_K=vv38PA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLikBKi2jBNG6_O1uFUmMwfBC30ef5AG4ACjVv_K=vv38PA@mail.gmail.com>

On Thu, Oct 24, 2024 at 10:02:30PM -0700, Michael Chan wrote:
> On Tue, Oct 22, 2024 at 9:24 AM Taehee Yoo <ap420073@gmail.com> wrote:
> >
> > NICs that uses bnxt_en driver supports tcp-data-split feature by the
> > name of HDS(header-data-split).
> > But there is no implementation for the HDS to enable or disable by
> > ethtool.
> > Only getting the current HDS status is implemented and The HDS is just
> > automatically enabled only when either LRO, HW-GRO, or JUMBO is enabled.
> > The hds_threshold follows rx-copybreak value. and it was unchangeable.
> >
> > This implements `ethtool -G <interface name> tcp-data-split <value>`
> > command option.
> > The value can be <on>, <off>, and <auto> but the <auto> will be
> > automatically changed to <on>.
> >
> > HDS feature relies on the aggregation ring.
> > So, if HDS is enabled, the bnxt_en driver initializes the aggregation
> > ring.
> > This is the reason why BNXT_FLAG_AGG_RINGS contains HDS condition.
> >
> > Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> > ---
> >
> > v4:
> >  - Do not support disable tcp-data-split.
> >  - Add Test tag from Stanislav.
> >
> > v3:
> >  - No changes.
> >
> > v2:
> >  - Do not set hds_threshold to 0.
> >
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.c         |  8 +++-----
> >  drivers/net/ethernet/broadcom/bnxt/bnxt.h         |  5 +++--
> >  drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 13 +++++++++++++
> >  3 files changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > index 0f5fe9ba691d..91ea42ff9b17 100644
> > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> 
> > @@ -6420,15 +6420,13 @@ static int bnxt_hwrm_vnic_set_hds(struct bnxt *bp, struct bnxt_vnic_info *vnic)
> >
> >         req->flags = cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_JUMBO_PLACEMENT);
> >         req->enables = cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_JUMBO_THRESH_VALID);
> > +       req->jumbo_thresh = cpu_to_le16(bp->rx_buf_use_size);
> >
> > -       if (BNXT_RX_PAGE_MODE(bp)) {
> > -               req->jumbo_thresh = cpu_to_le16(bp->rx_buf_use_size);
> 
> Please explain why this "if" condition is removed.
> BNXT_RX_PAGE_MODE() means that we are in XDP mode and we currently
> don't support HDS in XDP mode.  Added Andy Gospo to CC so he can also
> comment.
> 

In bnxt_set_rx_skb_mode we set BNXT_FLAG_RX_PAGE_MODE and clear
BNXT_FLAG_AGG_RINGS, so this should work.  The only issue is that we
have spots in the driver where we check BNXT_RX_PAGE_MODE(bp) to
indicate that XDP single-buffer mode is enabled on the device.

If you need to respin this series I would prefer that the change is like
below to key off the page mode being disabled and BNXT_FLAG_AGG_RINGS
being enabled to setup HDS.  This will serve as a reminder that this is
for XDP.

@@ -6418,15 +6418,13 @@ static int bnxt_hwrm_vnic_set_hds(struct bnxt *bp, struct bnxt_vnic_info *vnic)
 
        req->flags = cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_JUMBO_PLACEMENT);
        req->enables = cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_JUMBO_THRESH_VALID);
+       req->jumbo_thresh = cpu_to_le16(bp->rx_buf_use_size);
 
-       if (BNXT_RX_PAGE_MODE(bp)) {
-               req->jumbo_thresh = cpu_to_le16(bp->rx_buf_use_size);
-       } else {
+       if (!BNXT_RX_PAGE_MODE(bp) && (bp->flags & BNXT_FLAG_AGG_RINGS)) {
                req->flags |= cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV4 |
                                          VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV6);
                req->enables |=
                        cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_HDS_THRESHOLD_VALID);
-               req->jumbo_thresh = cpu_to_le16(bp->rx_copy_thresh);
                req->hds_threshold = cpu_to_le16(bp->rx_copy_thresh);
        }
        req->vnic_id = cpu_to_le32(vnic->fw_vnic_id);

> > -       } else {
> > +       if (bp->flags & BNXT_FLAG_AGG_RINGS) {
> >                 req->flags |= cpu_to_le32(VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV4 |
> >                                           VNIC_PLCMODES_CFG_REQ_FLAGS_HDS_IPV6);
> >                 req->enables |=
> >                         cpu_to_le32(VNIC_PLCMODES_CFG_REQ_ENABLES_HDS_THRESHOLD_VALID);
> > -               req->jumbo_thresh = cpu_to_le16(bp->rx_copybreak);
> >                 req->hds_threshold = cpu_to_le16(bp->rx_copybreak);
> >         }
> >         req->vnic_id = cpu_to_le32(vnic->fw_vnic_id);



