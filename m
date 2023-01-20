Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC920675C12
	for <lists+linux-doc@lfdr.de>; Fri, 20 Jan 2023 18:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjATRvS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 Jan 2023 12:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjATRvQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 12:51:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3489BBF5F1;
        Fri, 20 Jan 2023 09:50:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AC40D6204C;
        Fri, 20 Jan 2023 17:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE67C433D2;
        Fri, 20 Jan 2023 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674237056;
        bh=do4wUTzBOXl7qaBrdSoBLwhfFD694Y2vTKVbXY7Yp70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iBD1KEkj1gymeN5j9i4euus8I36OoJCkZSMUv9Y0fzEuvMCKoRfI7mXGYZPxI7GXV
         4l8v9bwYei4uZVFhnw2SQZTi+eDvRM+0lwjpGsITRzFca1ppSZa7mrHHxwE1vgUyDQ
         FpKdca84fVhgf6aeGupVxHQg16RBM3mx7XXFXfNPZ+dD8au8GYNEGZPrHE27ikqQQ2
         z9qORLjPsQ2FUW13IOEzwpE6i8xYFataTfCYuDF406gPDzp71X/2vl0gzMbxIXOWAb
         xaO0zAxkQhZJJRcHRNnGNd5x1SbIH1Wk9+CAdLF0U8u0lcvFMxchasVznHqUGWlVQB
         9MKbIaHUzaLJw==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        robh@kernel.org, johannes@sipsolutions.net,
        stephen@networkplumber.org, ecree.xilinx@gmail.com, sdf@google.com,
        f.fainelli@gmail.com, fw@strlen.de, linux-doc@vger.kernel.org,
        razor@blackwall.org, nicolas.dichtel@6wind.com,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v4 8/8] tools: ynl: add a completely generic client
Date:   Fri, 20 Jan 2023 09:50:41 -0800
Message-Id: <20230120175041.342573-9-kuba@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120175041.342573-1-kuba@kernel.org>
References: <20230120175041.342573-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a CLI sample which can take in arbitrary request
in JSON format, convert it to Netlink and do the inverse
for output.

It's meant as a development tool primarily and perhaps
for selftests which need to tickle netlink in a special way.

Acked-by: Stanislav Fomichev <sdf@google.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/net/ynl/samples/cli.py |  47 +++
 tools/net/ynl/samples/ynl.py | 534 +++++++++++++++++++++++++++++++++++
 2 files changed, 581 insertions(+)
 create mode 100755 tools/net/ynl/samples/cli.py
 create mode 100644 tools/net/ynl/samples/ynl.py

diff --git a/tools/net/ynl/samples/cli.py b/tools/net/ynl/samples/cli.py
new file mode 100755
index 000000000000..b27159c70710
--- /dev/null
+++ b/tools/net/ynl/samples/cli.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python
+# SPDX-License-Identifier: BSD-3-Clause
+
+import argparse
+import json
+import pprint
+import time
+
+from ynl import YnlFamily
+
+
+def main():
+    parser = argparse.ArgumentParser(description='YNL CLI sample')
+    parser.add_argument('--spec', dest='spec', type=str, required=True)
+    parser.add_argument('--schema', dest='schema', type=str)
+    parser.add_argument('--json', dest='json_text', type=str)
+    parser.add_argument('--do', dest='do', type=str)
+    parser.add_argument('--dump', dest='dump', type=str)
+    parser.add_argument('--sleep', dest='sleep', type=int)
+    parser.add_argument('--subscribe', dest='ntf', type=str)
+    args = parser.parse_args()
+
+    attrs = {}
+    if args.json_text:
+        attrs = json.loads(args.json_text)
+
+    ynl = YnlFamily(args.spec, args.schema)
+
+    if args.ntf:
+        ynl.ntf_subscribe(args.ntf)
+
+    if args.sleep:
+        time.sleep(args.sleep)
+
+    if args.do or args.dump:
+        method = getattr(ynl, args.do if args.do else args.dump)
+
+        reply = method(attrs, dump=bool(args.dump))
+        pprint.PrettyPrinter().pprint(reply)
+
+    if args.ntf:
+        ynl.check_ntf()
+        pprint.PrettyPrinter().pprint(ynl.async_msg_queue)
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/net/ynl/samples/ynl.py b/tools/net/ynl/samples/ynl.py
new file mode 100644
index 000000000000..b71523d71d46
--- /dev/null
+++ b/tools/net/ynl/samples/ynl.py
@@ -0,0 +1,534 @@
+# SPDX-License-Identifier: BSD-3-Clause
+
+import functools
+import jsonschema
+import os
+import random
+import socket
+import struct
+import yaml
+
+#
+# Generic Netlink code which should really be in some library, but I can't quickly find one.
+#
+
+
+class Netlink:
+    # Netlink socket
+    SOL_NETLINK = 270
+
+    NETLINK_ADD_MEMBERSHIP = 1
+    NETLINK_CAP_ACK = 10
+    NETLINK_EXT_ACK = 11
+
+    # Netlink message
+    NLMSG_ERROR = 2
+    NLMSG_DONE = 3
+
+    NLM_F_REQUEST = 1
+    NLM_F_ACK = 4
+    NLM_F_ROOT = 0x100
+    NLM_F_MATCH = 0x200
+    NLM_F_APPEND = 0x800
+
+    NLM_F_CAPPED = 0x100
+    NLM_F_ACK_TLVS = 0x200
+
+    NLM_F_DUMP = NLM_F_ROOT | NLM_F_MATCH
+
+    NLA_F_NESTED = 0x8000
+    NLA_F_NET_BYTEORDER = 0x4000
+
+    NLA_TYPE_MASK = NLA_F_NESTED | NLA_F_NET_BYTEORDER
+
+    # Genetlink defines
+    NETLINK_GENERIC = 16
+
+    GENL_ID_CTRL = 0x10
+
+    # nlctrl
+    CTRL_CMD_GETFAMILY = 3
+
+    CTRL_ATTR_FAMILY_ID = 1
+    CTRL_ATTR_FAMILY_NAME = 2
+    CTRL_ATTR_MAXATTR = 5
+    CTRL_ATTR_MCAST_GROUPS = 7
+
+    CTRL_ATTR_MCAST_GRP_NAME = 1
+    CTRL_ATTR_MCAST_GRP_ID = 2
+
+    # Extack types
+    NLMSGERR_ATTR_MSG = 1
+    NLMSGERR_ATTR_OFFS = 2
+    NLMSGERR_ATTR_COOKIE = 3
+    NLMSGERR_ATTR_POLICY = 4
+    NLMSGERR_ATTR_MISS_TYPE = 5
+    NLMSGERR_ATTR_MISS_NEST = 6
+
+
+class NlAttr:
+    def __init__(self, raw, offset):
+        self._len, self._type = struct.unpack("HH", raw[offset:offset + 4])
+        self.type = self._type & ~Netlink.NLA_TYPE_MASK
+        self.payload_len = self._len
+        self.full_len = (self.payload_len + 3) & ~3
+        self.raw = raw[offset + 4:offset + self.payload_len]
+
+    def as_u16(self):
+        return struct.unpack("H", self.raw)[0]
+
+    def as_u32(self):
+        return struct.unpack("I", self.raw)[0]
+
+    def as_u64(self):
+        return struct.unpack("Q", self.raw)[0]
+
+    def as_strz(self):
+        return self.raw.decode('ascii')[:-1]
+
+    def as_bin(self):
+        return self.raw
+
+    def __repr__(self):
+        return f"[type:{self.type} len:{self._len}] {self.raw}"
+
+
+class NlAttrs:
+    def __init__(self, msg):
+        self.attrs = []
+
+        offset = 0
+        while offset < len(msg):
+            attr = NlAttr(msg, offset)
+            offset += attr.full_len
+            self.attrs.append(attr)
+
+    def __iter__(self):
+        yield from self.attrs
+
+    def __repr__(self):
+        msg = ''
+        for a in self.attrs:
+            if msg:
+                msg += '\n'
+            msg += repr(a)
+        return msg
+
+
+class NlMsg:
+    def __init__(self, msg, offset, attr_space=None):
+        self.hdr = msg[offset:offset + 16]
+
+        self.nl_len, self.nl_type, self.nl_flags, self.nl_seq, self.nl_portid = \
+            struct.unpack("IHHII", self.hdr)
+
+        self.raw = msg[offset + 16:offset + self.nl_len]
+
+        self.error = 0
+        self.done = 0
+
+        extack_off = None
+        if self.nl_type == Netlink.NLMSG_ERROR:
+            self.error = struct.unpack("i", self.raw[0:4])[0]
+            self.done = 1
+            extack_off = 20
+        elif self.nl_type == Netlink.NLMSG_DONE:
+            self.done = 1
+            extack_off = 4
+
+        self.extack = None
+        if self.nl_flags & Netlink.NLM_F_ACK_TLVS and extack_off:
+            self.extack = dict()
+            extack_attrs = NlAttrs(self.raw[extack_off:])
+            for extack in extack_attrs:
+                if extack.type == Netlink.NLMSGERR_ATTR_MSG:
+                    self.extack['msg'] = extack.as_strz()
+                elif extack.type == Netlink.NLMSGERR_ATTR_MISS_TYPE:
+                    self.extack['miss-type'] = extack.as_u32()
+                elif extack.type == Netlink.NLMSGERR_ATTR_MISS_NEST:
+                    self.extack['miss-nest'] = extack.as_u32()
+                elif extack.type == Netlink.NLMSGERR_ATTR_OFFS:
+                    self.extack['bad-attr-offs'] = extack.as_u32()
+                else:
+                    if 'unknown' not in self.extack:
+                        self.extack['unknown'] = []
+                    self.extack['unknown'].append(extack)
+
+            if attr_space:
+                # We don't have the ability to parse nests yet, so only do global
+                if 'miss-type' in self.extack and 'miss-nest' not in self.extack:
+                    miss_type = self.extack['miss-type']
+                    if len(attr_space.attr_list) > miss_type:
+                        spec = attr_space.attr_list[miss_type]
+                        desc = spec['name']
+                        if 'doc' in spec:
+                            desc += f" ({spec['doc']})"
+                        self.extack['miss-type'] = desc
+
+    def __repr__(self):
+        msg = f"nl_len = {self.nl_len} ({len(self.raw)}) nl_flags = 0x{self.nl_flags:x} nl_type = {self.nl_type}\n"
+        if self.error:
+            msg += '\terror: ' + str(self.error)
+        if self.extack:
+            msg += '\textack: ' + repr(self.extack)
+        return msg
+
+
+class NlMsgs:
+    def __init__(self, data, attr_space=None):
+        self.msgs = []
+
+        offset = 0
+        while offset < len(data):
+            msg = NlMsg(data, offset, attr_space=attr_space)
+            offset += msg.nl_len
+            self.msgs.append(msg)
+
+    def __iter__(self):
+        yield from self.msgs
+
+
+genl_family_name_to_id = None
+
+
+def _genl_msg(nl_type, nl_flags, genl_cmd, genl_version, seq=None):
+    # we prepend length in _genl_msg_finalize()
+    if seq is None:
+        seq = random.randint(1, 1024)
+    nlmsg = struct.pack("HHII", nl_type, nl_flags, seq, 0)
+    genlmsg = struct.pack("bbH", genl_cmd, genl_version, 0)
+    return nlmsg + genlmsg
+
+
+def _genl_msg_finalize(msg):
+    return struct.pack("I", len(msg) + 4) + msg
+
+
+def _genl_load_families():
+    with socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, Netlink.NETLINK_GENERIC) as sock:
+        sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_CAP_ACK, 1)
+
+        msg = _genl_msg(Netlink.GENL_ID_CTRL,
+                        Netlink.NLM_F_REQUEST | Netlink.NLM_F_ACK | Netlink.NLM_F_DUMP,
+                        Netlink.CTRL_CMD_GETFAMILY, 1)
+        msg = _genl_msg_finalize(msg)
+
+        sock.send(msg, 0)
+
+        global genl_family_name_to_id
+        genl_family_name_to_id = dict()
+
+        while True:
+            reply = sock.recv(128 * 1024)
+            nms = NlMsgs(reply)
+            for nl_msg in nms:
+                if nl_msg.error:
+                    print("Netlink error:", nl_msg.error)
+                    return
+                if nl_msg.done:
+                    return
+
+                gm = GenlMsg(nl_msg)
+                fam = dict()
+                for attr in gm.raw_attrs:
+                    if attr.type == Netlink.CTRL_ATTR_FAMILY_ID:
+                        fam['id'] = attr.as_u16()
+                    elif attr.type == Netlink.CTRL_ATTR_FAMILY_NAME:
+                        fam['name'] = attr.as_strz()
+                    elif attr.type == Netlink.CTRL_ATTR_MAXATTR:
+                        fam['maxattr'] = attr.as_u32()
+                    elif attr.type == Netlink.CTRL_ATTR_MCAST_GROUPS:
+                        fam['mcast'] = dict()
+                        for entry in NlAttrs(attr.raw):
+                            mcast_name = None
+                            mcast_id = None
+                            for entry_attr in NlAttrs(entry.raw):
+                                if entry_attr.type == Netlink.CTRL_ATTR_MCAST_GRP_NAME:
+                                    mcast_name = entry_attr.as_strz()
+                                elif entry_attr.type == Netlink.CTRL_ATTR_MCAST_GRP_ID:
+                                    mcast_id = entry_attr.as_u32()
+                            if mcast_name and mcast_id is not None:
+                                fam['mcast'][mcast_name] = mcast_id
+                if 'name' in fam and 'id' in fam:
+                    genl_family_name_to_id[fam['name']] = fam
+
+
+class GenlMsg:
+    def __init__(self, nl_msg):
+        self.nl = nl_msg
+
+        self.hdr = nl_msg.raw[0:4]
+        self.raw = nl_msg.raw[4:]
+
+        self.genl_cmd, self.genl_version, _ = struct.unpack("bbH", self.hdr)
+
+        self.raw_attrs = NlAttrs(self.raw)
+
+    def __repr__(self):
+        msg = repr(self.nl)
+        msg += f"\tgenl_cmd = {self.genl_cmd} genl_ver = {self.genl_version}\n"
+        for a in self.raw_attrs:
+            msg += '\t\t' + repr(a) + '\n'
+        return msg
+
+
+class GenlFamily:
+    def __init__(self, family_name):
+        self.family_name = family_name
+
+        global genl_family_name_to_id
+        if genl_family_name_to_id is None:
+            _genl_load_families()
+
+        self.genl_family = genl_family_name_to_id[family_name]
+        self.family_id = genl_family_name_to_id[family_name]['id']
+
+
+#
+# YNL implementation details.
+#
+
+
+class YnlAttrSpace:
+    def __init__(self, family, yaml):
+        self.yaml = yaml
+
+        self.attrs = dict()
+        self.name = self.yaml['name']
+        self.subspace_of = self.yaml['subset-of'] if 'subspace-of' in self.yaml else None
+
+        val = 0
+        max_val = 0
+        for elem in self.yaml['attributes']:
+            if 'value' in elem:
+                val = elem['value']
+            else:
+                elem['value'] = val
+            if val > max_val:
+                max_val = val
+            val += 1
+
+            self.attrs[elem['name']] = elem
+
+        self.attr_list = [None] * (max_val + 1)
+        for elem in self.yaml['attributes']:
+            self.attr_list[elem['value']] = elem
+
+    def __getitem__(self, key):
+        return self.attrs[key]
+
+    def __contains__(self, key):
+        return key in self.yaml
+
+    def __iter__(self):
+        yield from self.attrs
+
+    def items(self):
+        return self.attrs.items()
+
+
+class YnlFamily:
+    def __init__(self, def_path, schema=None):
+        self.include_raw = False
+
+        with open(def_path, "r") as stream:
+            self.yaml = yaml.safe_load(stream)
+
+        if schema:
+            with open(schema, "r") as stream:
+                schema = yaml.safe_load(stream)
+
+            jsonschema.validate(self.yaml, schema)
+
+        self.sock = socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, Netlink.NETLINK_GENERIC)
+        self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_CAP_ACK, 1)
+        self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_EXT_ACK, 1)
+
+        self._ops = dict()
+        self._spaces = dict()
+        self._types = dict()
+
+        for elem in self.yaml['attribute-sets']:
+            self._spaces[elem['name']] = YnlAttrSpace(self, elem)
+
+        for elem in self.yaml['definitions']:
+            self._types[elem['name']] = elem
+
+        async_separation = 'async-prefix' in self.yaml['operations']
+        self.async_msg_ids = set()
+        self.async_msg_queue = []
+        val = 0
+        max_val = 0
+        for elem in self.yaml['operations']['list']:
+            if not (async_separation and ('notify' in elem or 'event' in elem)):
+                if 'value' in elem:
+                    val = elem['value']
+                else:
+                    elem['value'] = val
+                val += 1
+                max_val = max(val, max_val)
+
+            if 'notify' in elem or 'event' in elem:
+                self.async_msg_ids.add(elem['value'])
+
+            self._ops[elem['name']] = elem
+
+            op_name = elem['name'].replace('-', '_')
+
+            bound_f = functools.partial(self._op, elem['name'])
+            setattr(self, op_name, bound_f)
+
+        self._op_array = [None] * max_val
+        for _, op in self._ops.items():
+            self._op_array[op['value']] = op
+            if 'notify' in op:
+                op['attribute-set'] = self._ops[op['notify']]['attribute-set']
+
+        self.family = GenlFamily(self.yaml['name'])
+
+    def ntf_subscribe(self, mcast_name):
+        if mcast_name not in self.family.genl_family['mcast']:
+            raise Exception(f'Multicast group "{mcast_name}" not present in the family')
+
+        self.sock.bind((0, 0))
+        self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_ADD_MEMBERSHIP,
+                             self.family.genl_family['mcast'][mcast_name])
+
+    def _add_attr(self, space, name, value):
+        attr = self._spaces[space][name]
+        nl_type = attr['value']
+        if attr["type"] == 'nest':
+            nl_type |= Netlink.NLA_F_NESTED
+            attr_payload = b''
+            for subname, subvalue in value.items():
+                attr_payload += self._add_attr(attr['nested-attributes'], subname, subvalue)
+        elif attr["type"] == 'u32':
+            attr_payload = struct.pack("I", int(value))
+        elif attr["type"] == 'string':
+            attr_payload = str(value).encode('ascii') + b'\x00'
+        elif attr["type"] == 'binary':
+            attr_payload = value
+        else:
+            raise Exception(f'Unknown type at {space} {name} {value} {attr["type"]}')
+
+        pad = b'\x00' * ((4 - len(attr_payload) % 4) % 4)
+        return struct.pack('HH', len(attr_payload) + 4, nl_type) + attr_payload + pad
+
+    def _decode_enum(self, rsp, attr_spec):
+        raw = rsp[attr_spec['name']]
+        enum = self._types[attr_spec['enum']]
+        i = attr_spec.get('value-start', 0)
+        if 'enum-as-flags' in attr_spec and attr_spec['enum-as-flags']:
+            value = set()
+            while raw:
+                if raw & 1:
+                    value.add(enum['entries'][i])
+                raw >>= 1
+                i += 1
+        else:
+            value = enum['entries'][raw - i]
+        rsp[attr_spec['name']] = value
+
+    def _decode(self, attrs, space):
+        attr_space = self._spaces[space]
+        rsp = dict()
+        for attr in attrs:
+            attr_spec = attr_space.attr_list[attr.type]
+            if attr_spec["type"] == 'nest':
+                subdict = self._decode(NlAttrs(attr.raw), attr_spec['nested-attributes'])
+                rsp[attr_spec['name']] = subdict
+            elif attr_spec['type'] == 'u32':
+                rsp[attr_spec['name']] = attr.as_u32()
+            elif attr_spec['type'] == 'u64':
+                rsp[attr_spec['name']] = attr.as_u64()
+            elif attr_spec["type"] == 'string':
+                rsp[attr_spec['name']] = attr.as_strz()
+            elif attr_spec["type"] == 'binary':
+                rsp[attr_spec['name']] = attr.as_bin()
+            else:
+                raise Exception(f'Unknown {attr.type} {attr_spec["name"]} {attr_spec["type"]}')
+
+            if 'enum' in attr_spec:
+                self._decode_enum(rsp, attr_spec)
+        return rsp
+
+    def handle_ntf(self, nl_msg, genl_msg):
+        msg = dict()
+        if self.include_raw:
+            msg['nlmsg'] = nl_msg
+            msg['genlmsg'] = genl_msg
+        op = self._op_array[genl_msg.genl_cmd]
+        msg['name'] = op['name']
+        msg['msg'] = self._decode(genl_msg.raw_attrs, op['attribute-set'])
+        self.async_msg_queue.append(msg)
+
+    def check_ntf(self):
+        while True:
+            try:
+                reply = self.sock.recv(128 * 1024, socket.MSG_DONTWAIT)
+            except BlockingIOError:
+                return
+
+            nms = NlMsgs(reply)
+            for nl_msg in nms:
+                if nl_msg.error:
+                    print("Netlink error in ntf!?", os.strerror(-nl_msg.error))
+                    print(nl_msg)
+                    continue
+                if nl_msg.done:
+                    print("Netlink done while checking for ntf!?")
+                    continue
+
+                gm = GenlMsg(nl_msg)
+                if gm.genl_cmd not in self.async_msg_ids:
+                    print("Unexpected msg id done while checking for ntf", gm)
+                    continue
+
+                self.handle_ntf(nl_msg, gm)
+
+    def _op(self, method, vals, dump=False):
+        op = self._ops[method]
+
+        nl_flags = Netlink.NLM_F_REQUEST | Netlink.NLM_F_ACK
+        if dump:
+            nl_flags |= Netlink.NLM_F_DUMP
+
+        req_seq = random.randint(1024, 65535)
+        msg = _genl_msg(self.family.family_id, nl_flags, op['value'], 1, req_seq)
+        for name, value in vals.items():
+            msg += self._add_attr(op['attribute-set'], name, value)
+        msg = _genl_msg_finalize(msg)
+
+        self.sock.send(msg, 0)
+
+        done = False
+        rsp = []
+        while not done:
+            reply = self.sock.recv(128 * 1024)
+            nms = NlMsgs(reply, attr_space=self._spaces[op['attribute-set']])
+            for nl_msg in nms:
+                if nl_msg.error:
+                    print("Netlink error:", os.strerror(-nl_msg.error))
+                    print(nl_msg)
+                    return
+                if nl_msg.done:
+                    done = True
+                    break
+
+                gm = GenlMsg(nl_msg)
+                # Check if this is a reply to our request
+                if nl_msg.nl_seq != req_seq or gm.genl_cmd != op['value']:
+                    if gm.genl_cmd in self.async_msg_ids:
+                        self.handle_ntf(nl_msg, gm)
+                        continue
+                    else:
+                        print('Unexpected message: ' + repr(gm))
+                        continue
+
+                rsp.append(self._decode(gm.raw_attrs, op['attribute-set']))
+
+        if not rsp:
+            return None
+        if not dump and len(rsp) == 1:
+            return rsp[0]
+        return rsp
-- 
2.39.0

