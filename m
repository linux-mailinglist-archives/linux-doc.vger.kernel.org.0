Return-Path: <linux-doc+bounces-65230-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C85C26713
	for <lists+linux-doc@lfdr.de>; Fri, 31 Oct 2025 18:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D9756281B
	for <lists+linux-doc@lfdr.de>; Fri, 31 Oct 2025 17:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05664258EC3;
	Fri, 31 Oct 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="aDsGvjIB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F841F4617
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761931833; cv=none; b=Az8Vi4Nq9eFglIWtvu9fF+jWSCJfIDY/2ObxFytLPAjyXWQzs1tJYm3iVRWF4xYsNhDpESlQUyG+L4z3rTj45p1E7OdDzrcn+Pa21Hntm32soqKLfgFfTvkh/Oi/xmzziUMf/KimlHS34k/HJbWVba7PZhSRHiNQHL1ZyYTxecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761931833; c=relaxed/simple;
	bh=/4NUosojYw14l9RP2wTbIe+vINI+8c9ZZ+FQrVCN4hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loMOfw3vOmkhs8xSc/Ok2KiP57hSkVeuhc/zfxaEUOKkgHDigPK1S3pnMEOkV1Mvttwq/K0FuLdwGirgVEl+hOJ15qDaAIYy+at7fwlfL+r8CZS3Xob+Lno3iOKS4VS5r55z35TY7443AKPrVuQ+NoYehosO9noTtLgYasTy7+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=aDsGvjIB; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2728683b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761931832; x=1762536632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9IaWectU89+Tfdd2SWxnAs2i8ZZ82BZgrVmURYyxk8=;
        b=aDsGvjIBStJFdhyBHjbFrRYGPuLwTvMi84iTNFwXcVOryGad+fjAWS4evHuDh3lJMB
         qmGzKq72XYJgsdxJIcy8TbPN7HbEWVMI4tatUU6Aapoyt/oTyup+yOOHx24i9isxUA7j
         7n2mVO010HBzf/DMOl1v0RAM8mTD21krFIHgUAgvVOQm0Psekl65qINTMIzeH3LDlMwd
         fgSgqnX4nvRXVCWeAkYiHQuf9W06Zu5zwyiA5cbA7///2CnzWFb8g3sxDG0hCK/X5+hd
         ksRlITkIc7hR/44lgchTbK19BGwZOPEQO0zTMRb+NZB/PaxQWkUfy7TGcvwUR1aYH++u
         PzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761931832; x=1762536632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9IaWectU89+Tfdd2SWxnAs2i8ZZ82BZgrVmURYyxk8=;
        b=l7fMiedIvZiJ7/+ybiIQQS0kFHVLAhvmt9tsvvzEStxwRr+QhBTjUAaoqLK+4mu57U
         tQhSpDdT2iDCw1ztHD6h58wIVrsFHrZ2wrB5Jx2h7inI9ba9bX8YThJqGAKWrNuQPXX2
         tH8YXXdmC1kca9XMkBysd5/u2vgLyKXXIcAIn4E/XM4KxFJcuoXh3Ob8YNOMu9Oh7p3l
         z/0GvjlQi0ltpUMjaezL0zPsDTDBugF0ZsDYXi1sEtJBB1+KSofN29uB968jyTbB9imL
         LqHhVmhisDuE1hW/9dPDr27Cd3Nk8xeaEKCdKKvCyq61Rr7/TtbptjUIvqsKDE/9Ilv8
         T9rw==
X-Forwarded-Encrypted: i=1; AJvYcCWeiMCO99cTGhN0CY4rvr8dwF80bepgRnP35j8XNaDZwmmFbJge8fCl/x/ynrlOr9p5PCjnKXG6H74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/b16EQWvcwoFJ1oDAFJgWogCtVHSKBN4NdPrAktWbMOQE5XpV
	8FQOMBPHq4WT/ANT6vlMZRUCMuabvR+XytyaeqpK6TnrPXmdYFaTOiTwu+KLJsoVMsnp+y6YUun
	YDnvogqtd5Q==
X-Gm-Gg: ASbGncsTAUqsw20BH1BIht/zLs09cyh80ji/ecmtPvDGkA3yg85h2lthsmbRbH9mDn8
	rwnKYs3erKXUVuihBUZkZcQSvoYqG1s7i0wqwclwynn5/K3sP1DUGRzfuvdb5vAEJsfsINpoJr7
	GYnq4zKtz0qaayeE4ljPBugr6WVwXTNtoTscZdhwhR5jWBSXohAgBSIq3TAajP7DmZ/uiLDSYQk
	U5U1pWWPQ1x8bY33SCQFwLCE2FUgDNusNu/u3iIBavxVEGR+AsBfXcpubpi4E6mHM3OJ8xIyCZt
	ea5jkQd3xuq3aTfOpAryfDDDa3iBiumXbmYjpN8qhA1azosbSuplNk+JGH7Amnv2CJgt3pj+5hi
	IfM6hsexNOSvYmJCboA77KsuznN4oUSxL3Mk/rkfTqZ1/+kwubK0kq0oiRGs8KxFfpzox6Mnjb5
	71Xo2jZIRt38SCldf0
X-Google-Smtp-Source: AGHT+IGHZuSNPg64weN7MygzE+D+JmL2pDp9GEsG2OfutOUVQ3cd7U4bVtqYoUkGlzWxt2+UcaITRg==
X-Received: by 2002:a05:6a20:914c:b0:341:471c:9392 with SMTP id adf61e73a8af0-348ba87a6ffmr5874081637.10.1761931831675;
        Fri, 31 Oct 2025 10:30:31 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:2da:2c8a:f651:af34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm2857660b3a.8.2025.10.31.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:30:31 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Fri, 31 Oct 2025 10:30:28 -0700
Message-ID: <20251031173029.904313-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <35d41d46-5bc8-43af-a84d-6b118fff08e0@kernel.org>
References: <35d41d46-5bc8-43af-a84d-6b118fff08e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>>> On 10/28/25 08:17, Igor Reznichenko wrote:
>>>> Understood. The bit in question controls the alert pin polarity on the device side,
>>>> independent of whether the pin is used as interrupt or not. I'll drop the property
>>>> for now and revisit if there's a board that actually uses an inverter or needs to
>>>> program the bit explicitly.
>>>>
>>>
>>> This is kind of unusual. The requirement used to be that devicetree properties
>>> shall be complete. "Only if there is a known use case" is a significant policy
>>> change. Has the policy changed recently ?
>>>
>>> Thanks,
>>> Guenter
>> 
>> Rob, following up on Guenter's question above.
>> I'm not sure whether it's better to drop the property as discussed earlier or keep
>> it for binding completeness. 
>> Could you clarify what approach is preferred?
>
>Don't you have there possibility of interrupt (not only SMBus Alert)? At
>least this is what I understood from previous talks.

Yes, the alert pin could be used as interrupt in principle.
Datasheet calls it "Multi-functional digital alert pin".

Thanks, Igor

