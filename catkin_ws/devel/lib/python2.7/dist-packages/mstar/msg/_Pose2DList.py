# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from mstar/Pose2DList.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import mstar.msg

class Pose2DList(genpy.Message):
  _md5sum = "5e69772910d4436923e40502b8e6c939"
  _type = "mstar/Pose2DList"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """Pose2D[] poses
================================================================================
MSG: mstar/Pose2D
float32 x
float32 y
float32 yaw
"""
  __slots__ = ['poses']
  _slot_types = ['mstar/Pose2D[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       poses

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Pose2DList, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.poses is None:
        self.poses = []
    else:
      self.poses = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.poses)
      buff.write(_struct_I.pack(length))
      for val1 in self.poses:
        _x = val1
        buff.write(_struct_3f.pack(_x.x, _x.y, _x.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.poses is None:
        self.poses = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.poses = []
      for i in range(0, length):
        val1 = mstar.msg.Pose2D()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.yaw,) = _struct_3f.unpack(str[start:end])
        self.poses.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.poses)
      buff.write(_struct_I.pack(length))
      for val1 in self.poses:
        _x = val1
        buff.write(_struct_3f.pack(_x.x, _x.y, _x.yaw))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.poses is None:
        self.poses = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.poses = []
      for i in range(0, length):
        val1 = mstar.msg.Pose2D()
        _x = val1
        start = end
        end += 12
        (_x.x, _x.y, _x.yaw,) = _struct_3f.unpack(str[start:end])
        self.poses.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_3f = struct.Struct("<3f")