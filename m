Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAB7652D04
	for <lists+linux-doc@lfdr.de>; Wed, 21 Dec 2022 07:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiLUGq6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 21 Dec 2022 01:46:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbiLUGq5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Dec 2022 01:46:57 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC87F1EC71
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 22:46:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id bj12so34456791ejb.13
        for <linux-doc@vger.kernel.org>; Tue, 20 Dec 2022 22:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAVMql90nO7ZkFcVgMNu6fVpAbtsWgSiB+5IHPtWWmc=;
        b=LAn8A6q3x/FxImTU7EI//vFipPthxtzU9CCh1UlabVwIoxxqd3FVtp9nlPG3NakRLN
         SYvnKRpPj9rPDJmzRpl2ABWyyAaD8IfdvokDJ9iRekjZOeaVZXE4998zBRpntD0xTo0t
         zWLJ+Yz02YTk8MXQhIRPIuphm3zS3fu2TuR/GnM4DQHuxBe6iUVQWNe6FuFiwyoYqyA3
         5iwNSTJxIaWxf1STTVWEShE9l4tdC+y+yWEOZlJnc2vg8AikhmA3K/6jdaJmkn4OZ6Si
         Tcu3ccyDyds681GzjwZUE4PXEs52QbeiKfsux2FN/Lsy2UN1gVARItqg+CM37mxV/3Cq
         Rd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAVMql90nO7ZkFcVgMNu6fVpAbtsWgSiB+5IHPtWWmc=;
        b=j9EIFm2ep+oEOV+Wzrubobwlqe/MMevoRuSOrsbJil3WQSa/JDrIS7hxahprG7ohSA
         YgQxb1Z55X2bNI41AlUC7uYZ35n1Vv5Jt4uhksAH/5Ms24G2biC5O2sTvIQuH7k+LtC8
         pWCLi/ASXfoRxO1Z/HmmkBRkE9F2N6e97iZsah8HGP/Zgznuk9rz2w0e9CXpG1eTcpan
         eg4qBPOrypu31piwrNF1tURjNxe20jKfSKc+DK0uGFr5fWAsxLpXFPM0hk08kCNG2nBx
         s1BgG9TbHagrZQbsfQQZfVT2qnHbHphnmaPD9urBcIweKED0izHVm0Aln73wKk38Ynte
         vpEw==
X-Gm-Message-State: AFqh2kq6TN5zOb7IB3hEuo2nEVpK0SzBy4neDFfCez4Mg6LfOGPMDoKo
        Xe9G3A0XJG7T7O3sZCay7XMlatf3u7c3ZBa24ms=
X-Google-Smtp-Source: AMrXdXsy6U3KyN+8+jn5v2xOSWzTtJPiz6KIbtFyXTms7FfdcTs+5eU99zz8pSApZy3b2GiXX5eKzmcSV01kukO30eA=
X-Received: by 2002:a17:906:4f12:b0:77f:9082:73c7 with SMTP id
 t18-20020a1709064f1200b0077f908273c7mr23621eju.517.1671605215225; Tue, 20 Dec
 2022 22:46:55 -0800 (PST)
MIME-Version: 1.0
Sender: goodw771@gmail.com
Received: by 2002:a05:640c:1a0c:b0:189:ab5b:3d94 with HTTP; Tue, 20 Dec 2022
 22:46:54 -0800 (PST)
From:   H mimi m <mimih6474@gmail.com>
Date:   Wed, 21 Dec 2022 06:46:54 +0000
X-Google-Sender-Auth: dp3PlfOk9U9aB-AeJyV_-nRkJqE
Message-ID: <CAM0SVCachfT5FX0dTme0mFfAEGeXC1yPbUMeHuzq7sj2VTQ-dw@mail.gmail.com>
Subject: REPLY ME
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

i am Mrs Mimi Hassan Abdul Mohammad and i was diagnosed with cancer
about 2 years
ago,before i go for a surgery  i  have to do this,so  If you are
interested to use the sum of US17.3Million)to help Poor,
Less-privileged and  ORPHANAGES and invest  in your country, get back
to me for more information on how you can  contact the COMPANY in
Ouagadougou Burkina Faso). for where the fund is
Warm Regards,
Mrs Mimi Hassan Abdul Mohammad
