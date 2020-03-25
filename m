Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB32191F4F
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2020 03:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCYChy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Mar 2020 22:37:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42352 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbgCYChy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Mar 2020 22:37:54 -0400
Received: by mail-pg1-f194.google.com with SMTP id h8so416637pgs.9
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2020 19:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=VRnQilnt07d1oqQ4KQil6Mz63llajYTl97NmNGSglPo=;
        b=YKxyAk3ZQU7yENdjEqMIxZP3xJ5UXORg5Wf994rlklKQNuw65fwL2GtrHKEuOOgQXY
         SByDSi7BXw5nEX22nOtxCwYolWNrZ5/RKwfx7pDywcRUfqxqKfQvMdw+iCUaW+DqXrtU
         WBff/Ecpq8xlXKaDdC+WJaNl9cT7o1158Rv7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=VRnQilnt07d1oqQ4KQil6Mz63llajYTl97NmNGSglPo=;
        b=Y1D4mLE6HaIMzrtpvV9YFvP/m5jaAUQmJXUu+HZ0b/Zc6kgNoimop6Q43vCDMD8DkZ
         e2HiPz2y8IlkCtv/qwhK4Wn4kIm77Td8Bz1VASknvuo/N4VzMlEmkTUoWqVxyEQxmHe9
         tjwjWaXeIrQv48XMv/sRyMjSfPZ9tVj0OIjw55K/kCin0xfnwl4pf8k157VUZ63PffLv
         b97qMv7EhV/iG576V5gf00/uPlAo0HN0K6wkFmeU3eeS1Q6mbVETHXuINN3jlgM49EZA
         Cobfy060TTXmcFFOrwHK00+sNbixlNIwtPpiFkDiMl9ZhLtOqn9E7QXIQ53W2kVmOirY
         ssFA==
X-Gm-Message-State: ANhLgQ1RHljJ4FY1iM/eVLcEa/yfyQhRJTLbrcCR+8Hd/7Gmq8His/tI
        IO9ZUwhCJjgKF5w6WE+aDIa7TQ==
X-Google-Smtp-Source: ADFU+vseJ+fw2H4J2gLn7jXALCAM+os616BkOMYNzL7Tq2/7qkx6ZJNgGF+lIAIFjgr8xWMqoG2MaA==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr727458pgb.99.1585103873356;
        Tue, 24 Mar 2020 19:37:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e14sm16965737pfn.196.2020.03.24.19.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 19:37:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <66b8da28bbf0af6d8bd23953936e7feb6a7ed0c2.1584966325.git.mchehab+huawei@kernel.org>
References: <66b8da28bbf0af6d8bd23953936e7feb6a7ed0c2.1584966325.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 1/2] docs: dt: qcom,dwc3.txt: fix cross-reference for a converted file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Tue, 24 Mar 2020 19:37:51 -0700
Message-ID: <158510387182.125146.16270632251829962912@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-03-23 05:25:27)
> The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> Update cross-reference accordingly.
>=20
> Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bin=
dings to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
