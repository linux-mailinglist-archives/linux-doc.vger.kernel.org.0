Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FB8672822
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jan 2023 20:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjART15 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Jan 2023 14:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjART1z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 14:27:55 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011065412A
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 11:27:55 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id vm8so85695397ejc.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 11:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JZz6oidXAn2QdegqqTrRadFQ8TSF4EcGXr4bCOfWWSs=;
        b=VZLlx04jnBUrGMFE/IRpTEByge8H7+EDnQnba2/7Wi8JEvDWR9nEJS88qCKuuK/JIc
         DcUxFt8+IkO8XCZ2OpCOneZFk98GNojYhCUR6QndeFTuTjueI5Gx8v9+I40jm86HU6R4
         GcP+c4Ty1HOJ6+WmUZpMJUJiwESPTyzHUMmUxcYkvc0szdkoC4afa8uWO9ku/9mmDUi8
         akkzlahbtsWY1lkDehdMhoT0hx0LTpjyCxHjG8gkFy27MQOWe8ybzcw+ofo++Xmqo+GB
         vHE82h/o0TBEdG6K2BJfnpwQODqAIhb+6r7A1ydsHq0SxQdweYbfWJVCfgtbB8RVwcPj
         /Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZz6oidXAn2QdegqqTrRadFQ8TSF4EcGXr4bCOfWWSs=;
        b=AMvAaS9zGn+32umTKXcJVCqyF+ilTM11fF+zQRNK2se+TCJpKBMBctv8wjYF1W7r9c
         2ea0cqqp/GDvL48fw7L/na6h4PSv7EbWsS+hzNFLDxO68wn6LepRbD1fYHakAZ6aUvyh
         IxOIelSMXyJX8CyIphm7R7W3Nra636feU363GXjZn2Y6n9tpCfbqfuudL/Js/bFgAGlP
         jXa7PdeiMHk7x/Jpc8kXfMZ9PK1nUAEbBtw/TjKJNX4BpZCIRVvGbEbV2M0GGKLp3DdH
         poFZz+F8ZLMCU7EwIIRj2pUNmPlkPkQCLNQfIpIRHcubay8Dbu3iB+pcApPnMpMhqM9c
         lhJA==
X-Gm-Message-State: AFqh2kq6Of8il3VtHEjR7iivLDaN6cwl1QeTgMkMzeZw6lgErcepGpjO
        1cDB3LAHrcVv7iajv7i2AhSjy2SeigNVPDO/pn4=
X-Google-Smtp-Source: AMrXdXuOIWlh9CnoeUiHvtQeEObl25270Cv07RcOVpe/1blfkoBDMEQzDL/2ikGHll9KuTCV2zM6BfRyom9k+UJbVZw=
X-Received: by 2002:a17:906:455:b0:86b:6a53:fade with SMTP id
 e21-20020a170906045500b0086b6a53fademr671440eja.168.1674070073411; Wed, 18
 Jan 2023 11:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7208:b14b:b0:61:43d4:7fda with HTTP; Wed, 18 Jan 2023
 11:27:52 -0800 (PST)
From:   kayla jone <kaylajone2010@gmail.com>
Date:   Wed, 18 Jan 2023 20:27:52 +0100
Message-ID: <CA+Kke92xkbaAGEQMXGmKis4F86_FV9AMB5kxzCpk8hT+FSPBHQ@mail.gmail.com>
Subject: @@
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello. Sir.

I`m  Miss Kayla Jone Anthony from Ukraine, I contacting you from
Turkey, I have something  important to share with you.

I will be grand to hear from you then i will give the full details.

Best regards
Kayla Jone Anthony
