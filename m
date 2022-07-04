Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A20565E1E
	for <lists+linux-doc@lfdr.de>; Mon,  4 Jul 2022 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiGDTqT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 4 Jul 2022 15:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGDTqT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jul 2022 15:46:19 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478AF65E8
        for <linux-doc@vger.kernel.org>; Mon,  4 Jul 2022 12:46:18 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id fw3so18221073ejc.10
        for <linux-doc@vger.kernel.org>; Mon, 04 Jul 2022 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=AOuJfDK+0QwtZ/uvgMV5qrF7D2aVWD/S//Bu+xTDlNs=;
        b=FIRv3UU5x6aGHh6XHF/MxNMUq7O7y45naJA+lWT+jRREvASG5ghj99dTxOEPX8P37x
         aOCotVY7iz07t32LS5CqO6RkRjZrmOlIb9b5HBtn4a864NNygHXCoxave2Z/Ga7oVth3
         5JEzBSWmBPMzrydpeGp+J9WEoexoCM/ymAHlmOcs/BPtth4ZpIoTP9vbJBF5SEiWEVvB
         RDTmoDO6ILkQe8Niyt8A3dEY/IcCLYlQjOu6Zam/bR2WdhOvqiY6X1bKvAI91aGX772w
         orB0FUeovaPyLc9iDyxaN53QSXxM1sH48qLt+hDcM9qbzpId9KuTpv+KMByqilpPHRv5
         4Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=AOuJfDK+0QwtZ/uvgMV5qrF7D2aVWD/S//Bu+xTDlNs=;
        b=3NJ+tT4bHdQDw7br3oWqrKRzGfw0/npdwBaLo3Bx5QzVE26uydq+y9gRbnnaTJ7e8+
         /WylTCbzO3rW+Ue4VM4Fl8nC29qHR/1idt0oXG4ztX02/ycgL4CKOE3xEnw2pHScvQtS
         j08NwQpwSTInAJw3MbXWzM0eB4ePWGgUPcoPTVxU0v5lbiKqAsSImTxVTXJaHBRzcTmX
         wTz52zAM/TlPgeQPYzkdLXxeHn1cwVJc2mQ+VF1NhEUyYWJwTw7cBYIE5DWHAyaffGHN
         OdYNKA+wuNhhMHLOQdurH06z+m5t1WaprEuA2C2aY0T7U3e/STzJmSZwn9mZ2xvuLBd2
         J+7g==
X-Gm-Message-State: AJIora9AeoNH23AS74MrroDIoO40Jv4QRWVorIkGLngHPFjHs+KZU3Gg
        LEYsWs0jZJzeX2CglYz6mGlP3chqF34zIIoP7Ww=
X-Google-Smtp-Source: AGRyM1sXvW+A05uQcF07KYSHuRoEfQeGeqjDhq2BwQeMq6p1o8/B93qGaTpx83IbwGwFuE3suEICS1gBDPlbp5mKXGw=
X-Received: by 2002:a17:907:2815:b0:72a:4eda:a35f with SMTP id
 eb21-20020a170907281500b0072a4edaa35fmr27024206ejc.636.1656963976709; Mon, 04
 Jul 2022 12:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:3283:0:0:0:0 with HTTP; Mon, 4 Jul 2022 12:46:16
 -0700 (PDT)
Reply-To: nikkifenton79@gmail.com
From:   Nikki Fenton <fdd97917@gmail.com>
Date:   Mon, 4 Jul 2022 21:46:16 +0200
Message-ID: <CAPLfORARcEbr9s=C8r8f-efeEKvasMfS=ukskq6Lw4NSzwEWCQ@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,
I viewed your profile on Linkedin regarding a proposal that has
something in common with you, reply for more details on my private
email:nikkifenton79@gmail.com

Nikki Fenton,
nikkifenton79@gmail.com
